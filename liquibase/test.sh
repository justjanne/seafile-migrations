#!/usr/bin/env bash
set -euo pipefail

./mysql-clean.sh $1
./mysql-legacy.sh $1
./mysql-migrated.sh $1

./pgsql-test.sh $1
./pgsql-clean.sh $1
./pgsql-legacy.sh $1
./pgsql-migrated.sh $1

./results.sh $1 > ../test/$1.txt
