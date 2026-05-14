#!/usr/bin/env bash
set -euo pipefail

mariadb -h 127.0.0.1 -u root -ppassword $1 < mysql/schemas/$1/131.sql || true

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" \
  update --changelog-file="$1.yaml"
