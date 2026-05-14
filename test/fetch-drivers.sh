#!/usr/bin/env bash
set -euo pipefail

PGSQL_VERSION=42.7.11
MYSQL_VERSION=3.5.8

mkdir -p drivers/
wget -nc -P drivers/ https://repo1.maven.org/maven2/org/postgresql/postgresql/$PGSQL_VERSION/postgresql-$PGSQL_VERSION.jar
wget -nc -P drivers/ https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/$MYSQL_VERSION/mariadb-java-client-$MYSQL_VERSION.jar
