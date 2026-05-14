#!/usr/bin/env bash
set -euo pipefail

./pgsql-prepare.sh "$1" "migrated"

psql postgres://postgres:password@localhost/$1 --file=schemas/$1/pgsql/018.sql || true
for i in $(ls migrations/$1/pgsql/*.sql | sort); do
  psql postgres://postgres:password@localhost/$1 --file=$i || true
done

liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" \
  --username="postgres" --password="password" --search-path="../liquibase/$1" \
  update --changelog-file=changelog.yaml

./pgsql-snapshot.sh "$1" "migrated"
