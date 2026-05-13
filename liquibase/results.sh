#!/usr/bin/env bash

for i in mysql-clean mysql-legacy mysql-migrated pgsql-clean pgsql-legacy pgsql-migrated pgsql-test; do
  sed -i -E '/^ *order: [0-9]+$/d' ../test/$1-$i.json
  sed -i -E 's/\bbigserial\b/int8/g' ../test/$1-$i.json
  sed -i -E 's/\bAUTO INCREMENT START WITH [0-9]+ INCREMENT BY [0-9]+\b/AUTO INCREMENT/g' ../test/$1-$i.json
done

echo "-- mysql-legacy"
diff -u ../test/$1-mysql-clean.json ../test/$1-mysql-legacy.json && echo "no change"
echo

echo "-- mysql-migrated"
diff -u ../test/$1-mysql-clean.json ../test/$1-mysql-migrated.json && echo "no change"
echo

echo "-- pgsql-legacy"
diff -u ../test/$1-pgsql-clean.json ../test/$1-pgsql-legacy.json && echo "no change"
echo

echo "-- pgsql-migrated"
diff -u ../test/$1-pgsql-clean.json ../test/$1-pgsql-migrated.json && echo "no change"
echo

echo "-- pgsql-test"
diff -u ../test/$1-pgsql-clean.json ../test/$1-pgsql-test.json && echo "no change"
echo
