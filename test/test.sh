#!/usr/bin/env bash
set -euo pipefail

./fetch-drivers.sh

for db in ccnet seafile; do
  ./mysql-clean.sh $db
  ./mysql-legacy.sh $db
  ./mysql-migrated.sh $db

  ./pgsql-clean.sh $db
  ./pgsql-legacy.sh $db
  ./pgsql-migrated.sh $db
  ./pgsql-test.sh $db

  ./results.sh $db > reports/$db.txt
done
