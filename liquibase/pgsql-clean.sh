#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE=../test/$1-pgsql-clean.json

# cleanup
echo > $OUTPUT_FILE
psql postgres://postgres:password@localhost/postgres -c "DROP DATABASE IF EXISTS $1"

# prepare
psql postgres://postgres:password@localhost/postgres -c "CREATE DATABASE $1"
./pgsql-prepare.sh $1

# migrate
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" update --changelog-file=changelog.yaml

# snapshot
for table in databasechangelog databasechangeloglock; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" snapshot --output-file=$OUTPUT_FILE
