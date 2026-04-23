#!/usr/bin/env bash

mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1"
mariadb -h 127.0.0.1 -u root -ppassword -e "CREATE DATABASE $1"
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" update --changelog-file=changelog.yaml
mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table DATABASECHANGELOG"
mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table DATABASECHANGELOGLOCK"
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" snapshot --output-file=../test/$1-mysql-migrated.json
sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-mysql-migrated.json
