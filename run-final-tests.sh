#!/bin/bash

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
        $CLI -c "DROP DATABASE IF EXISTS $db;" >/dev/null 2>&1
        $CLI -c "CREATE DATABASE $db;" >/dev/null 2>&1
    else
        $CLI -e "DROP DATABASE IF EXISTS $db; CREATE DATABASE $db;" >/dev/null 2>&1
    fi
}

run_liquibase() {
    local db=$1; local comp=$2
    liquibase --changelog-file=changelog.yaml --url="${URL_BASE}/${db}" --username=$USER --password=$PASS --classpath=$CLASSPATH --search-path="liquibase/${comp}/" update >/dev/null 2>&1
    return $?
}

dump_schema() {
    local db=$1; local out=$2
    if [ "$DB_TYPE" == "postgres" ]; then
        pg_dump -h 127.0.0.1 -U $USER -s $db 2>/dev/null > "${out}.tmp"
    else
        mariadb-dump -h 127.0.0.1 -u $USER -p$PASS --no-data $db 2>/dev/null > "${out}.tmp"
    fi
    python3 normalize_sql.py "${out}.tmp" > "$out"
    rm "${out}.tmp"
}

test_component() {
    local comp=$1
    local start_ver=$([ "$DB_TYPE" == "postgres" ] && echo "018" || echo "013")
    
    echo "=== Testing $comp on $DB_TYPE ==="

    echo "Scenario 1: Fresh Install"
    reset_db "${comp}_fresh"
    run_liquibase "${comp}_fresh" "$comp" || echo "  Liquibase failed on Fresh!"
    dump_schema "${comp}_fresh" "${comp}_fresh.sql"

    echo "Scenario 2: Partial Legacy"
    reset_db "${comp}_mid"
    local mid_ver=$([ "$DB_TYPE" == "postgres" ] && echo "042" || echo "041")
    ($CLI -d "${comp}_mid" < schemas/${comp}/${FOLDER}/${mid_ver}.sql >/dev/null 2>&1 || $CLI "${comp}_mid" < schemas/${comp}/${FOLDER}/${mid_ver}.sql >/dev/null 2>&1)
    for f in legacy/${comp}/${FOLDER}/*.sql; do
        legacy_ver=$(basename $f .sql)
        if [[ "$legacy_ver" > "$mid_ver" ]]; then
            ($CLI -d "${comp}_mid" < "$f" >/dev/null 2>&1 || $CLI "${comp}_mid" < "$f" >/dev/null 2>&1) || true
        fi
    done
    run_liquibase "${comp}_mid" "$comp" || echo "  Liquibase failed on Mid!"
    dump_schema "${comp}_mid" "${comp}_mid.sql"

    echo "Scenario 3: Full Legacy ($start_ver start)"
    reset_db "${comp}_all_legacy"
    ($CLI -d "${comp}_all_legacy" < schemas/${comp}/${FOLDER}/${start_ver}.sql >/dev/null 2>&1 || $CLI "${comp}_all_legacy" < schemas/${comp}/${FOLDER}/${start_ver}.sql >/dev/null 2>&1)
    for f in legacy/${comp}/${FOLDER}/*.sql; do
        legacy_ver=$(basename $f .sql)
        if [[ "$legacy_ver" > "$start_ver" ]]; then
            ($CLI -d "${comp}_all_legacy" < "$f" >/dev/null 2>&1 || $CLI "${comp}_all_legacy" < "$f" >/dev/null 2>&1) || true
        fi
    done
    run_liquibase "${comp}_all_legacy" "$comp" || echo "  Liquibase failed on Legacy!"
    dump_schema "${comp}_all_legacy" "${comp}_all_legacy.sql"

    echo "Scenario 4: 130 Schema Directly"
    reset_db "${comp}_130"
    ($CLI -d "${comp}_130" < schemas/${comp}/${FOLDER}/130.sql >/dev/null 2>&1 || $CLI "${comp}_130" < schemas/${comp}/${FOLDER}/130.sql >/dev/null 2>&1)
    run_liquibase "${comp}_130" "$comp" || echo "  Liquibase failed on 130!"
    dump_schema "${comp}_130" "${comp}_130.sql"

    echo "--- Parity Results for $comp ---"
    diff -s "${comp}_fresh.sql" "${comp}_mid.sql" || echo "  Mid mismatch!"
    diff -s "${comp}_fresh.sql" "${comp}_all_legacy.sql" || echo "  Legacy mismatch!"
    diff -s "${comp}_fresh.sql" "${comp}_130.sql" || echo "  130 mismatch!"
    echo ""
}

test_component "ccnet"
test_component "seafile"
