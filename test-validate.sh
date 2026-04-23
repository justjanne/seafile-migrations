#!/bin/bash
source test-common.sh

echo "Validating schema parity..."

function validate_parity() {
    local comp=$1
    local db_type=$2
    
    echo "  - Checking $comp on $db_type..."

    for env in fresh legacy_full legacy_partial 131; do
        if [ "$db_type" == "mariadb" ]; then
            mariadb-dump -h 127.0.0.1 -u $USER -p$PASS --no-data "${comp}_${env}" > "${comp}_${env}_${db_type}.sql" 2>/dev/null
        else
            export PGPASSWORD=$PGPASS
            pg_dump -h 127.0.0.1 -U $PGUSER -s "${comp}_${env}" > "${comp}_${env}_${db_type}.sql" 2>/dev/null
        fi
        
        # Normalize
        python3 normalize_sql.py "${comp}_${env}_${db_type}.sql" > "${comp}_${env}_${db_type}.norm"
    done

    # Compare
    diff -sq "${comp}_fresh_${db_type}.norm" "${comp}_legacy_full_${db_type}.norm" || echo "    WARNING: Legacy-Full drift detected on $db_type"
    diff -sq "${comp}_fresh_${db_type}.norm" "${comp}_legacy_partial_${db_type}.norm" || echo "    WARNING: Legacy-Partial drift detected on $db_type"
    diff -sq "${comp}_fresh_${db_type}.norm" "${comp}_131_${db_type}.norm" || echo "    WARNING: 131 drift detected on $db_type"
}

for comp in ccnet seafile; do
    validate_parity "$comp" "mariadb"
    validate_parity "$comp" "postgres"
done

echo "Done."
