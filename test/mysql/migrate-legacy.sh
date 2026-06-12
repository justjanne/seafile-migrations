#!/usr/bin/env bash
set -euo pipefail

mariadb -h 127.0.0.1 -u root -ppassword $1 < $(ls mysql/schemas/$1/*.sql | sort -n | head -n1) || true
for i in $(ls mysql/migrations/$1/*.sql | sort); do
  mariadb -h 127.0.0.1 -u root -ppassword $1 < $i || true
done

liquibase --url="jdbc:mariadb://127.0.0.1:3306/$1" --username="root" --password="password" \
  update --changelog-file="$1.yaml"
