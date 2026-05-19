#!/usr/bin/env bash
set -euo pipefail

if [ "${SEAFILE_DB_TYPE}" = "mysql" ]; then
  SEAFILE_DB_PROTOCOL="mariadb"
elif [ "${SEAFILE_DB_TYPE}" = "pgsql" ]; then
  SEAFILE_DB_PROTOCOL="postgresql"
else
  echo "Unsupported db type ${SEAFILE_DB_TYPE}"
  exit 1
fi

liquibase \
  --url="jdbc:${SEAFILE_DB_PROTOCOL}://${SEAFILE_DB_HOST}:${SEAFILE_DB_PORT}/${SEAFILE_CCNET_DB_NAME}" \
  "--username=${SEAFILE_DB_USER}" \
  "--password=${SEAFILE_DB_PASSWORD}" \
  update \
  --changelog-file="ccnet.yaml"

liquibase \
  --url="jdbc:${SEAFILE_DB_PROTOCOL}://${SEAFILE_DB_HOST}:${SEAFILE_DB_PORT}/${SEAFILE_SEAFILE_DB_NAME}" \
  "--username=${SEAFILE_DB_USER}" \
  "--password=${SEAFILE_DB_PASSWORD}" \
  update \
  --changelog-file="seafile.yaml"
