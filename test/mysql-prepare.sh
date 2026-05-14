#!/usr/bin/env bash
set -euo pipefail

mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS $1;"
mariadb -h 127.0.0.1 -u root -ppassword -e "CREATE DATABASE $1;"

mkdir -p reports/$1
echo > reports/$1/mysql-$2.json
