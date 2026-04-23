#!/usr/bin/env bash

LIQUIBASE_ARGS="--url='jdbc:mariadb://127.0.0.1:3306/$1' --username='root' --password='password' --search-path='$1'"
mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1; CREATE DATABASE $1;"
liquibase $LIQUIBASE_ARGS update --changelog-file=changelog.yaml
liquibase $LIQUIBASE_ARGS snapshot --output-file=../test/$1-mysql.json
