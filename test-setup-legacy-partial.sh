#!/bin/bash
source test-common.sh

echo "Setting up legacy-partial environments (v063 -> v070 legacy)..."

function setup_legacy_partial() {
    local comp=$1
    local db_type=$2
    local db="${comp}_legacy_partial"
    local folder=""
    local cli=""
    
    if [ "$db_type" == "mariadb" ]; then
        folder="mysql"; cli="$MARIADB_CLI"; reset_db_mariadb "$db"
    else
        folder="pgsql"; cli="$POSTGRES_CLI"; reset_db_postgres "$db"
    fi

    echo "    - Initializing $db_type at v063 for $comp..."
    if [ "$db_type" == "mariadb" ]; then
        $cli "$db" < schemas/$comp/$folder/063.sql >/dev/null 2>&1
    else
        $cli -d "$db" < schemas/$comp/$folder/063.sql >/dev/null 2>&1
    fi

    echo "    - Migrating $db_type up to v070 using legacy scripts..."
    if [ -d "legacy/$comp/$folder" ]; then
        for v in $(ls legacy/$comp/$folder/*.sql | awk -F'/' '{print $NF}' | sed 's/.sql//' | sort -n); do
            # Convert version to number for comparison
            v_num=$(echo $v | sed 's/^0*//')
            if [ "$v_num" -gt 63 ] && [ "$v_num" -le 70 ]; then
                if [ "$db_type" == "mariadb" ]; then
                    $cli "$db" < legacy/$comp/$folder/$v.sql >/dev/null 2>&1
                else
                    $cli -d "$db" < legacy/$comp/$folder/$v.sql >/dev/null 2>&1
                fi
            fi
        done
    fi
}

for comp in ccnet seafile; do
    setup_legacy_partial "$comp" "mariadb"
    setup_legacy_partial "$comp" "postgres"
done
echo "Done."
