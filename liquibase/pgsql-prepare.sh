#!/usr/bin/env bash
set -euo pipefail

for table in ldapconfig LDAPConfig orgfileextwhitelist userrole; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done
