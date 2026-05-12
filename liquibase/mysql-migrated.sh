#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE=../test/$1-mysql-migrated.json

# cleanup
echo > $OUTPUT_FILE
mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1;"

# prepare
mariadb -h 127.0.0.1 -u root -ppassword -e "CREATE DATABASE $1;"
mariadb -h 127.0.0.1 -u root -ppassword $1 < ../schemas/$1/mysql/018.sql || true
for i in $(ls ../legacy/$1/mysql/*.sql | sort); do
  mariadb -h 127.0.0.1 -u root -ppassword $1 < $i || true
done

# migrate
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" update --changelog-file=changelog.yaml

# snapshot
for table in DATABASECHANGELOG DATABASECHANGELOGLOCK; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`" || true
done
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" snapshot --output-file=$OUTPUT_FILE
