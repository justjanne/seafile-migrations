#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE=../test/$1-pgsql-legacy.json

# cleanup
echo > $OUTPUT_FILE
psql postgres://postgres:password@localhost/postgres -c "DROP DATABASE IF EXISTS $1"

# prepare
psql postgres://postgres:password@localhost/postgres -c "CREATE DATABASE $1"
psql postgres://postgres:password@localhost/ccnet --file=../schemas/$1/pgsql/131.sql || true

# migrate
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" update --changelog-file=changelog.yaml

# snapshot
for table in databasechangelog databasechangeloglock; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" snapshot --output-file=$OUTPUT_FILE
