#!/usr/bin/env bash
set -euo pipefail

psql postgres://postgres:password@localhost/postgres -c "DROP DATABASE IF EXISTS $1"
psql postgres://postgres:password@localhost/postgres -c "CREATE DATABASE $1"

mkdir -p reports
echo > reports/$1-pgsql-$2.json
