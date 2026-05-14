#!/usr/bin/env bash
set -euo pipefail

./mysql-prepare.sh "$1" "legacy"

mariadb -h 127.0.0.1 -u root -ppassword $1 < schemas/$1/mysql/131.sql || true

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" \
  --username="root" --password="password" --search-path="../liquibase/$1" \
  update --changelog-file=changelog.yaml

./mysql-snapshot.sh "$1" "legacy"
