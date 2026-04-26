#!/usr/bin/env bash

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
