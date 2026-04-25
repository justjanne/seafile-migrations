#!/usr/bin/env bash

# cleanup
psql postgres://postgres:password@localhost/postgres -c "DROP DATABASE IF EXISTS $1"

# prepare
psql postgres://postgres:password@localhost/postgres -c "CREATE DATABASE $1"
for table in Group groupdnpair groupstructure GroupStructure groupuser ldapconfig LDAPConfig ldapusers organization orgfileextwhitelist orggroup orguser userrole; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\""
done

# migrate
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" update --changelog-file=changelog.yaml

# snapshot
for table in databasechangelog databasechangeloglock; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\""
done
liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" --search-path="$1" snapshot --output-file=../test/$1-pgsql-clean.json
sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-pgsql-clean.json
