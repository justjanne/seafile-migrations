#!/usr/bin/env bash
set -euo pipefail

mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`DATABASECHANGELOG\`"
mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`DATABASECHANGELOGLOCK\`"

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" \
  snapshot --output-file=reports/$1-mysql-$2.json
