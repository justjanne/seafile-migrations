#!/bin/bash
DB_TYPE="postgres"
URL_POSTGRES="jdbc:postgresql://127.0.0.1:5432"
USER="postgres"
PASS="password"
CLASSPATH="lib/postgresql.jar"
CLI="psql -h 127.0.0.1 -U $USER"
export PGPASSWORD=$PASS
FOLDER="pgsql"
comp="ccnet"

$CLI -c "DROP DATABASE IF EXISTS ${comp}_legacy;" >/dev/null 2>&1 || true
$CLI -c "CREATE DATABASE ${comp}_legacy;" >/dev/null 2>&1
versions=$(ls schemas/${comp}/${FOLDER}/*.sql | awk -F/ '{print $NF}' | sed 's/.sql//' | sort)
for ver in $versions; do
    ($CLI -d "${comp}_legacy" < "schemas/${comp}/${FOLDER}/${ver}.sql" >/dev/null 2>&1 || $CLI "${comp}_legacy" < "schemas/${comp}/${FOLDER}/${ver}.sql" >/dev/null 2>&1) || true
    legacy_file="legacy/${comp}/${FOLDER}/${ver}.sql"
    if [ -f "$legacy_file" ]; then
        ($CLI -d "${comp}_legacy" < "$legacy_file" >/dev/null 2>&1 || $CLI "${comp}_legacy" < "$legacy_file" >/dev/null 2>&1) || true
    fi
done

liquibase --changelog-file=changelog.yaml --url="${URL_POSTGRES}/${comp}_legacy" --username=$USER --password=$PASS --classpath=$CLASSPATH --search-path="liquibase/${comp}/" update
echo "EXIT CODE: $?"
