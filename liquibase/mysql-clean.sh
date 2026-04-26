#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE=../test/$1-mysql-clean.json

# cleanup
echo > $OUTPUT_FILE
mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1;"

# prepare
mariadb -h 127.0.0.1 -u root -ppassword -e "CREATE DATABASE $1;"
for table in Group GroupDNPair GroupStructure GroupUser LDAPConfig LDAPUsers Organization OrgFileExtWhiteList OrgGroup OrgUser UserRole; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`" || true
done

# migrate
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" update --changelog-file=changelog.yaml

# snapshot
for table in DATABASECHANGELOG DATABASECHANGELOGLOCK; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`" || true
done
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" snapshot --output-file=$OUTPUT_FILE
