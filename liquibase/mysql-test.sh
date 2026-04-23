#!/usr/bin/env bash

mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1; CREATE DATABASE $1;"
liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" --search-path="$1" update --changelog-file=changelog.yaml
