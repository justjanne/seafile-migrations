#!/usr/bin/env bash

mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1; CREATE DATABASE $1;"
mariadb -h 127.0.0.1 -u root -ppassword $1 < ../schemas/$1/mysql/131.sql
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" snapshot --output-file=../test/$1-mysql-legacy.json
sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-mysql-legacy.json
