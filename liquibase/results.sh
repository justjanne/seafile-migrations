#!/usr/bin/env bash

for i in mysql-clean mysql-legacy mysql-migrated pgsql-clean pgsql-legacy pgsql-migrated; do
  sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-$i.json
  sed -i -E 's/\bbigserial\b/int8/g' ../test/$1-$i.json
done

echo "-- mysql-legacy"
diff -u ../test/$1-mysql-clean.json ../test/$1-mysql-legacy.json && echo "no change" || echo "missing file"
echo

echo "-- mysql-migrated"
diff -u ../test/$1-mysql-clean.json ../test/$1-mysql-migrated.json && echo "no change" || echo "missing file"
echo

echo "-- pgsql-legacy"
diff -u ../test/$1-pgsql-clean.json ../test/$1-pgsql-legacy.json && echo "no change" || echo "missing file"
echo

echo "-- pgsql-migrated"
diff -u ../test/$1-pgsql-clean.json ../test/$1-pgsql-migrated.json && echo "no change" || echo "missing file"
echo
