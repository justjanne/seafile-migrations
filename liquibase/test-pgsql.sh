#!/usr/bin/env bash

LIQUIBASE_ARGS="--url='jdbc:postgresql://127.0.0.1:5432/$1' --username='postgres' --password='password' --search-path='$1'"
PGPASSWORD=password psql -h 127.0.0.1 -U postgres -c "DROP DATABASE IF EXISTS $1; CREATE DATABASE $1;"
liquibase $LIQUIBASE_ARGS update --changelog-file=changelog.yaml
liquibase $LIQUIBASE_ARGS snapshot --output-file=../test/$1-pgsql.json
