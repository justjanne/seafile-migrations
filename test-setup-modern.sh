#!/bin/bash
source test-common.sh

echo "Setting up modern environments (131 schema)..."

function setup_modern() {
    local comp=$1
    local db_type=$2
    local db="${comp}_131"
    local folder=""
    local cli=""
    
    if [ "$db_type" == "mariadb" ]; then
        folder="mysql"
        cli="$MARIADB_CLI"
        reset_db_mariadb "$db"
    else
        folder="pgsql"
        cli="$POSTGRES_CLI"
        reset_db_postgres "$db"
    fi

    echo "    - Loading $db_type 131 schema for $comp..."
    if [ "$db_type" == "mariadb" ]; then
        $cli "$db" < schemas/$comp/$folder/131.sql >/dev/null 2>&1
    else
        # Handle cases where pgsql 131 might not exist yet in your project
        if [ -f "schemas/$comp/$folder/131.sql" ]; then
            $cli -d "$db" < schemas/$comp/$folder/131.sql >/dev/null 2>&1
        fi
    fi
}

for comp in ccnet seafile; do
    echo "  - Setting up $comp modern..."
    setup_modern "$comp" "mariadb"
    setup_modern "$comp" "postgres"
done

echo "Done."
