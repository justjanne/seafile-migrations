#!/usr/bin/env bash
set -euo pipefail

psql postgres://postgres:password@localhost/$1 --file=pgsql/schemas/$1/018.sql || true
for i in $(ls pgsql/migrations/$1/*.sql | sort); do
  psql postgres://postgres:password@localhost/$1 --file=$i || true
done

liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" \
  update --changelog-file="$1.yaml"
