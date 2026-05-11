#!/usr/bin/env bash
set -euo pipefail

for table in LDAPConfig LDAPUsers Organization OrgFileExtWhiteList OrgGroup OrgUser UserRole; do
  mariadb -h 127.0.0.1 -u root -ppassword $1 -e "drop table if exists \`$table\`" || true
done
