#!/bin/bash
source test-common.sh

echo "Running migrations..."

for db_type in mariadb postgres; do
    for comp in ccnet seafile; do
        for env in fresh legacy_full legacy_partial 131; do
            echo "  - Migrating $comp ($env) on $db_type..."
            run_liquibase "${comp}_${env}" "$comp" "$db_type"
        done
    done
done

echo "Done."
