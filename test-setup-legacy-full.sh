#!/bin/bash
source test-common.sh

echo "Setting up legacy-full environments (v013 -> all legacy)..."

function setup_legacy_full() {
    local comp=$1
    local db_type=$2
    local db="${comp}_legacy_full"
    local folder=""
    local cli=""
    
    if [ "$db_type" == "mariadb" ]; then
        folder="mysql"; cli="$MARIADB_CLI"; reset_db_mariadb "$db"
    else
        folder="pgsql"; cli="$POSTGRES_CLI"; reset_db_postgres "$db"
    fi

    echo "    - Replaying $db_type history for $comp..."
    # 1. Load all schemas in order
    for v in $(ls schemas/$comp/$folder/*.sql | awk -F'/' '{print $NF}' | sed 's/.sql//' | sort -n); do
        if [ "$db_type" == "mariadb" ]; then
            $cli "$db" < schemas/$comp/$folder/$v.sql >/dev/null 2>&1
        else
            $cli -d "$db" < schemas/$comp/$folder/$v.sql >/dev/null 2>&1
        fi
    done

    # 2. Load all legacy migrations in order
    if [ -d "legacy/$comp/$folder" ]; then
        for v in $(ls legacy/$comp/$folder/*.sql | awk -F'/' '{print $NF}' | sed 's/.sql//' | sort -n); do
            if [ "$db_type" == "mariadb" ]; then
                $cli "$db" < legacy/$comp/$folder/$v.sql >/dev/null 2>&1
            else
                $cli -d "$db" < legacy/$comp/$folder/$v.sql >/dev/null 2>&1
            fi
        done
    fi
}

for comp in ccnet seafile; do
    setup_legacy_full "$comp" "mariadb"
    setup_legacy_full "$comp" "postgres"
done
echo "Done."
