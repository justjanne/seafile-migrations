#!/usr/bin/env bash
set -euo pipefail

./pgsql-prepare.sh "$1" "test"

psql postgres://postgres:password@localhost/$1 --file=schemas/$1/test.sql || true

liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" \
  --username="postgres" --password="password" --search-path="../liquibase/$1" \
  update --changelog-file=changelog.yaml

./pgsql-snapshot.sh "$1" "test"
