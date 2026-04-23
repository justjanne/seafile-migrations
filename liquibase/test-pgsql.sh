#!/usr/bin/env bash

PGPASSWORD=password psql -h 127.0.0.1 -U postgres -c "DROP DATABASE IF EXISTS ccnet; CREATE DATABASE ccnet;"
liquibase --changelog-file=changelog.yaml --url="jdbc:postgresql://127.0.0.1:5432" --username="postgres" --password="password" --search-path="ccnet" update

#PGPASSWORD=password psql -h 127.0.0.1 -U postgres -c "DROP DATABASE IF EXISTS seafile; CREATE DATABASE seafile;"
#liquibase --changelog-file=changelog.yaml --url="jdbc:postgresql://127.0.0.1:5432" --username="postgres" --password="password" --search-path="seafile" update
