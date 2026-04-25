#!/usr/bin/env bash

# cleanup
mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1;"

# prepare
mariadb -h 127.0.0.1 -u root -ppassword -e "CREATE DATABASE $1;"
mariadb -h 127.0.0.1 -u root -ppassword $1 < ../schemas/$1/mysql/018.sql
for i in $(ls ../legacy/$1/mysql/*.sql | sort); do
  mariadb -h 127.0.0.1 -u root -ppassword $1 < $i
done
for table in Group GroupDNPair GroupStructure GroupUser LDAPConfig LDAPUsers Organization OrgFileExtWhiteList OrgGroup OrgUser UserRole; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`"
done

# migrate
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" update --changelog-file=changelog.yaml

# snapshot
for table in DATABASECHANGELOG DATABASECHANGELOGLOCK; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`"
done
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" snapshot --output-file=../test/$1-mysql-migrated.json
sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-mysql-migrated.json
