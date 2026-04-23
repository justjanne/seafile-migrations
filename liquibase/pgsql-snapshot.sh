#!/usr/bin/env bash

PGPASSWORD=password psql -h 127.0.0.1 -U postgres -c "DROP DATABASE IF EXISTS $1; CREATE DATABASE $1;"
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" snapshot --snapshot-format=json --output-file=../test/$1-pgsql.json
