#!/usr/bin/env bash
set -euo pipefail

./mysql-prepare.sh "$1" "clean"

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" \
  update --changelog-file="$1.yaml"

./mysql-snapshot.sh "$1" "clean"
