#!/usr/bin/env bash
set -euo pipefail

for table in ldapconfig LDAPConfig ldapusers organization orgfileextwhitelist orggroup orguser userrole; do
  psql postgres://postgres:password@localhost/$1 -c "drop table if exists \"$table\"" || true
done
