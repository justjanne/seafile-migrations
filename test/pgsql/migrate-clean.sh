#!/usr/bin/env bash
set -euo pipefail

liquibase --url="jdbc:postgresql://127.0.0.1:5432/$1" --username="postgres" --password="password" \
  update --changelog-file="$1.yaml"
