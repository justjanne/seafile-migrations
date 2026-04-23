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
    URL_BASE=$URL_POSTGRES
    USER=$PGUSER
    PASS=$PGPASS
    CLASSPATH="lib/postgresql.jar"
    CLI="psql -h 127.0.0.1 -U $USER"
    export PGPASSWORD=$PASS
else
    URL_BASE=$URL_MARIADB
    CLASSPATH="lib/mariadb-java-client.jar"
    CLI="mariadb -h 127.0.0.1 -u $USER -p$PASS"
fi

reset_db() {
    local db=$1
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -c "DROP DATABASE IF EXISTS $db;"
        $CLI -c "CREATE DATABASE $db;"
    else
        $CLI -e "DROP DATABASE IF EXISTS $db; CREATE DATABASE $db;"
    fi
}

run_liquibase() {
    local db=$1
    local comp=$2
    liquibase --changelog-file=changelog.yaml --url="${URL_BASE}/${db}" --username=$USER --password=$PASS --classpath=$CLASSPATH --search-path="liquibase/${comp}/" update
}

dump_schema() {
    local db=$1
    local out=$2
    if [ "$DB_TYPE" == "postgres" ]; then
        pg_dump -h 127.0.0.1 -U $USER -s $db | grep -ivE "SET |CREATE SCHEMA|EXTENSION|COMMENT ON" | sed 's/public\.//g' | sort > "$out"
    else
        mariadb-dump -h 127.0.0.1 -u $USER -p$PASS --no-data $db | grep -vE "AUTO_INCREMENT|DATABASECHANGELOG|/\*|--" | tr '[:upper:]' '[:lower:]' | sort > "$out"
    fi
}

verify_component() {
    local comp=$2
    echo "=== Verifying $comp parity on $DB_TYPE ==="
    
    # 1. Fresh Install
    reset_db "${comp}_fresh"
    run_liquibase "${comp}_fresh" "$comp"
    dump_schema "${comp}_fresh" "${comp}_fresh.sql"

    # 2. Legacy Start
    reset_db "${comp}_legacy"
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -d "${comp}_legacy" < "schemas/${comp}/pgsql/018.sql"
    else
        $CLI "${comp}_legacy" < "schemas/${comp}/mysql/013.sql"
    fi
    run_liquibase "${comp}_legacy" "$comp"
    dump_schema "${comp}_legacy" "${comp}_legacy.sql"

    # 3. Reference 130
    reset_db "${comp}_ref"
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -d "${comp}_ref" < "schemas/${comp}/pgsql/130.sql"
    else
        $CLI "${comp}_ref" < "schemas/${comp}/mysql/130.sql"
    fi
    run_liquibase "${comp}_ref" "$comp"
    dump_schema "${comp}_ref" "${comp}_ref.sql"

    echo "--- Diffing Fresh vs Legacy ---"
    diff -q "${comp}_fresh.sql" "${comp}_legacy.sql" || echo "WARNING: Differences found between Fresh and Legacy"
    
    echo "--- Diffing Fresh vs Reference ---"
    diff -q "${comp}_fresh.sql" "${comp}_ref.sql" || echo "WARNING: Differences found between Fresh and Reference"
}

verify_component "ccnet" "ccnet"
verify_component "seafile" "seafile"
