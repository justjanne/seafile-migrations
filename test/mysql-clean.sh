#!/usr/bin/env bash
set -euo pipefail

./mysql-prepare.sh "$1" "clean"

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" \
  --username="root" --password="password" --search-path="../liquibase/$1" \
  update --changelog-file=changelog.yaml

./mysql-snapshot.sh "$1" "clean"
