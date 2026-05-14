#!/usr/bin/env bash

for report in reports/$1/*.json; do
  sed -i -E '/^ *order: [0-9]+$/d' $report
  sed -i -E 's/\bbigserial\b/int8/g' $report
  sed -i -E 's/\bAUTO INCREMENT START WITH [0-9]+ INCREMENT BY [0-9]+\b/AUTO INCREMENT/g' $report
done

echo "-- mysql-legacy"
diff -u reports/$1/mysql-clean.json reports/$1/mysql-legacy.json && echo "no change"
echo

echo "-- mysql-migrated"
diff -u reports/$1/mysql-clean.json reports/$1/mysql-migrated.json && echo "no change"
echo

echo "-- pgsql-legacy"
diff -u reports/$1/pgsql-clean.json reports/$1/pgsql-legacy.json && echo "no change"
echo

echo "-- pgsql-migrated"
diff -u reports/$1/pgsql-clean.json reports/$1/pgsql-migrated.json && echo "no change"
echo

echo "-- pgsql-test"
diff -u reports/$1/pgsql-clean.json reports/$1/pgsql-test.json && echo "no change"
echo
