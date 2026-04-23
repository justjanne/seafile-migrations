#!/bin/bash
set -e

DB_TYPE=${1:-mariadb}
URL_MARIADB="jdbc:mariadb://127.0.0.1:3306"
URL_POSTGRES="jdbc:postgresql://127.0.0.1:5432"
USER="root"
PASS="password"
PGUSER="postgres"
PGPASS="password"

if [ "$DB_TYPE" == "postgres" ]; then
    URL_BASE=$URL_POSTGRES; USER=$PGUSER; PASS=$PGPASS; CLASSPATH="lib/postgresql.jar"; CLI="psql -h 127.0.0.1 -U $USER"; export PGPASSWORD=$PASS; FOLDER="pgsql"
else
    URL_BASE=$URL_MARIADB; CLASSPATH="lib/mariadb-java-client.jar"; CLI="mariadb -h 127.0.0.1 -u $USER -p$PASS"; FOLDER="mysql"
fi

reset_db() {
    local db=$1
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -c "DROP DATABASE IF EXISTS $db;" >/dev/null 2>&1 || true
        $CLI -c "CREATE DATABASE $db;" >/dev/null 2>&1
    else
        $CLI -e "DROP DATABASE IF EXISTS $db; CREATE DATABASE $db;" >/dev/null 2>&1
    fi
}

run_liquibase() {
    local db=$1; local comp=$2
    liquibase --changelog-file=changelog.yaml --url="${URL_BASE}/${db}" --username=$USER --password=$PASS --classpath=$CLASSPATH --search-path="liquibase/${comp}/" update >/dev/null 2>&1
}

dump_schema() {
    local db=$1; local out=$2
    if [ "$DB_TYPE" == "postgres" ]; then
        pg_dump -h 127.0.0.1 -U $USER -s $db 2>/dev/null | grep -ivE "SET |CREATE SCHEMA|EXTENSION|COMMENT ON|Owner:" | sed 's/public\.//g' | sort > "$out"
    else
        # We lowercase MariaDB dumps to verify logical equality (as it's case-sensitive on Linux)
        mariadb-dump -h 127.0.0.1 -u $USER -p$PASS --no-data $db 2>/dev/null | grep -vE "AUTO_INCREMENT|DATABASECHANGELOG|/\*|--" | tr '[:upper:]' '[:lower:]' | sort > "$out"
    fi
}

test_component() {
    local comp=$1
    local start_ver=$([ "$DB_TYPE" == "postgres" ] && echo "018" || echo "013")
    
    echo "=== Testing $comp on $DB_TYPE ==="

    echo "Scenario 1: Fresh Install"
    reset_db "${comp}_fresh"
    run_liquibase "${comp}_fresh" "$comp"
    dump_schema "${comp}_fresh" "${comp}_fresh.sql"

    echo "Scenario 3: Full Sequential Legacy Upgrade"
    reset_db "${comp}_legacy"
    versions=$(ls schemas/${comp}/${FOLDER}/*.sql | awk -F/ '{print $NF}' | sed 's/.sql//' | sort)
    for ver in $versions; do
        ($CLI -d "${comp}_legacy" < "schemas/${comp}/${FOLDER}/${ver}.sql" >/dev/null 2>&1 || $CLI "${comp}_legacy" < "schemas/${comp}/${FOLDER}/${ver}.sql" >/dev/null 2>&1) || true
        legacy_file="legacy/${comp}/${FOLDER}/${ver}.sql"
        if [ -f "$legacy_file" ]; then
            ($CLI -d "${comp}_legacy" < "$legacy_file" >/dev/null 2>&1 || $CLI "${comp}_legacy" < "$legacy_file" >/dev/null 2>&1) || true
        fi
    done
    run_liquibase "${comp}_legacy" "$comp"
    dump_schema "${comp}_legacy" "${comp}_legacy.sql"

    echo "Scenario 4: 130 Schema Directly"
    reset_db "${comp}_130"
    ($CLI -d "${comp}_130" < schemas/${comp}/${FOLDER}/130.sql >/dev/null 2>&1 || $CLI "${comp}_130" < schemas/${comp}/${FOLDER}/130.sql >/dev/null 2>&1) || true
    run_liquibase "${comp}_130" "$comp"
    dump_schema "${comp}_130" "${comp}_130.sql"

    echo "--- Parity Results for $comp ---"
    diff -sq "${comp}_fresh.sql" "${comp}_legacy.sql"
    diff -sq "${comp}_fresh.sql" "${comp}_130.sql"
    echo ""
}

test_component "ccnet"
test_component "seafile"
