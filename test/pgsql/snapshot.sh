#!/usr/bin/env bash
set -euo pipefail

psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"databasechangelog\""
psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"databasechangeloglock\""

liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" \
  snapshot --output-file=reports/$1-pgsql-$2.json
