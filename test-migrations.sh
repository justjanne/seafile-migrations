#!/bin/bash
set -e

# Configuration
DB_TYPE=${1:-mariadb} # mariadb or postgres
MARIADB_URL="jdbc:mariadb://127.0.0.1:3306"
POSTGRES_URL="jdbc:postgresql://127.0.0.1:5432"
USER="root"
PASS="password"
PGUSER="postgres"
PGPASS="password"

if [ "$DB_TYPE" == "postgres" ]; then
    URL_BASE=$POSTGRES_URL
    USER=$PGUSER
    PASS=$PGPASS
    CLASSPATH="lib/postgresql.jar"
    CLI="psql -h 127.0.0.1 -U $USER"
    export PGPASSWORD=$PASS
else
    URL_BASE=$MARIADB_URL
    CLASSPATH="lib/mariadb-java-client.jar"
    CLI="mariadb -h 127.0.0.1 -u $USER -p$PASS"
fi

echo "Starting tests for $DB_TYPE..."

run_liquibase() {
    local db=$1
    local component=$2
    echo "--- Running Liquibase for $component on $db ---"
    liquibase --changelog-file=changelog.yaml \
      --url="${URL_BASE}/${db}" \
      --username=$USER --password=$PASS \
      --classpath=$CLASSPATH \
      --search-path="liquibase/${component}/" \
      --log-level=info \
      update
}

reset_db() {
    local db=$1
    echo "--- Resetting database $db ---"
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -c "DROP DATABASE IF EXISTS $db;"
        $CLI -c "CREATE DATABASE $db;"
    else
        $CLI -e "DROP DATABASE IF EXISTS $db; CREATE DATABASE $db;"
    fi
}

validate_ccnet() {
    local db=$1
    echo "--- Validating CCNET schema on $db ---"
    if [ "$DB_TYPE" == "postgres" ]; then
        count=$($CLI -d $db -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema='public' AND table_name NOT LIKE 'databasechangelog%';")
    else
        count=$($CLI $db -N -e "SELECT count(*) FROM information_schema.tables WHERE table_schema='$db' AND table_name NOT LIKE 'DATABASECHANGELOG%';")
    fi
    echo "Table count (excluding liquibase): $count"
    # Expected: 13 tables
    if [[ "$count" -ge 13 ]]; then
        echo "SUCCESS: CCNET table count is correct."
    else
        echo "FAILURE: CCNET table count is $count, expected >= 13"
        exit 1
    fi
}

validate_seafile() {
    local db=$1
    echo "--- Validating SEAFILE schema on $db ---"
    if [ "$DB_TYPE" == "postgres" ]; then
        count=$($CLI -d $db -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema='public' AND table_name NOT LIKE 'databasechangelog%';")
    else
        count=$($CLI $db -N -e "SELECT count(*) FROM information_schema.tables WHERE table_schema='$db' AND table_name NOT LIKE 'DATABASECHANGELOG%';")
    fi
    echo "Table count (excluding liquibase): $count"
    # Expected: 46 tables
    if [[ "$count" -ge 46 ]]; then
        echo "SUCCESS: SEAFILE table count is correct."
    else
        echo "FAILURE: SEAFILE table count is $count, expected >= 46"
        exit 1
    fi
}

test_fresh_install() {
    echo "=== SCENARIO: Fresh Install ==="
    reset_db "ccnet_fresh"
    run_liquibase "ccnet_fresh" "ccnet"
    validate_ccnet "ccnet_fresh"
    
    reset_db "seafile_fresh"
    run_liquibase "seafile_fresh" "seafile"
    validate_seafile "seafile_fresh"
}

test_legacy_v1() {
    echo "=== SCENARIO: Legacy v1 to Current ==="
    reset_db "ccnet_legacy"
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -d ccnet_legacy < schemas/ccnet/pgsql/018.sql
        $CLI -d ccnet_legacy < legacy/ccnet/pgsql/063.sql
    else
        $CLI ccnet_legacy < schemas/ccnet/mysql/013.sql
        $CLI ccnet_legacy < legacy/ccnet/mysql/018.sql
        $CLI ccnet_legacy < legacy/ccnet/mysql/063.sql
    fi
    run_liquibase "ccnet_legacy" "ccnet"
    validate_ccnet "ccnet_legacy"
}

test_mid_version() {
    echo "=== SCENARIO: v042 -> v063 Legacy -> Current ==="
    reset_db "seafile_mid"
    if [ "$DB_TYPE" == "postgres" ]; then
        $CLI -d seafile_mid < schemas/seafile/pgsql/042.sql
        $CLI -d seafile_mid < legacy/seafile/pgsql/063.sql
    else
        $CLI seafile_mid < schemas/seafile/mysql/042.sql
        $CLI seafile_mid < legacy/seafile/mysql/063.sql
    fi
    run_liquibase "seafile_mid" "seafile"
    validate_seafile "seafile_mid"
}

# Run them all
test_fresh_install
test_legacy_v1
test_mid_version

echo "ALL TESTS PASSED FOR $DB_TYPE"
