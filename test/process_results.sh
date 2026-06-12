#!/usr/bin/env bash
set -euo pipefail

echo "-- mysql-upstream"
diff -u reports/$1-pgsql-clean.json reports/$1-mysql-upstream.json && echo "no change"
echo

echo "-- mysql-legacy"
diff -u reports/$1-pgsql-clean.json reports/$1-mysql-legacy.json && echo "no change"
echo

echo "-- pgsql-upstream"
diff -u reports/$1-pgsql-clean.json reports/$1-pgsql-upstream.json && echo "no change"
echo

echo "-- pgsql-legacy"
diff -u reports/$1-pgsql-clean.json reports/$1-pgsql-legacy.json && echo "no change"
echo

echo "-- pgsql-test"
diff -u reports/$1-pgsql-clean.json reports/$1-pgsql-test.json && echo "no change"
echo
