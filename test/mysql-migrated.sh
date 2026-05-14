#!/usr/bin/env bash
set -euo pipefail

./mysql-prepare.sh "$1" "migrated"

mariadb -h 127.0.0.1 -u root -ppassword $1 < schemas/$1/mysql/018.sql || true
for i in $(ls migrations/$1/mysql/*.sql | sort); do
  mariadb -h 127.0.0.1 -u root -ppassword $1 < $i || true
done

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" \
  --username="root" --password="password" --search-path="../liquibase/$1" \
  update --changelog-file=changelog.yaml

./mysql-snapshot.sh "$1" "migrated"
