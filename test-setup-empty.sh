#!/bin/bash
source test-common.sh

echo "Setting up empty environments..."

for comp in ccnet seafile; do
    echo "  - Initializing $comp fresh databases..."
    reset_db_mariadb "${comp}_fresh"
    reset_db_postgres "${comp}_fresh"
done

echo "Done."
