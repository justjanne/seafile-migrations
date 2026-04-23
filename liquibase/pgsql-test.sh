#!/usr/bin/env bash

psql postgres://postgres:password@localhost/postgres -c "DROP DATABASE IF EXISTS $1"
psql postgres://postgres:password@localhost/postgres -c "CREATE DATABASE $1"
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" update --changelog-file=changelog.yaml
psql postgres://postgres:password@localhost/$1 -c "DROP TABLE databasechangelog"
psql postgres://postgres:password@localhost/$1 -c "DROP TABLE databasechangeloglock"
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" snapshot --output-file=../test/$1-pgsql-migrated.json
sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-pgsql-migrated.json
