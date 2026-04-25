#!/usr/bin/env bash
set -euo pipefail

./mysql-clean.sh ccnet
./mysql-legacy.sh ccnet
./mysql-migrated.sh ccnet

./pgsql-clean.sh ccnet
./pgsql-legacy.sh ccnet
./pgsql-migrated.sh ccnet
