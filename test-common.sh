#!/bin/bash

# Database Configuration
URL_MARIADB="jdbc:mariadb://127.0.0.1:3306"
URL_POSTGRES="jdbc:postgresql://127.0.0.1:5432"
USER="root"
PASS="password"
PGUSER="postgres"
PGPASS="password"

# CLI Tools
MARIADB_CLI="mariadb -h 127.0.0.1 -u $USER -p$PASS"
POSTGRES_CLI="export PGPASSWORD=$PGPASS; psql -h 127.0.0.1 -U $PGUSER"

# Liquibase Configuration
LIQUIBASE="liquibase --classpath=lib/mariadb-java-client.jar:lib/postgresql.jar"

function reset_db_mariadb() {
    local db=$1
    $MARIADB_CLI -e "DROP DATABASE IF EXISTS $db; CREATE DATABASE $db;" >/dev/null
}

function reset_db_postgres() {
    local db=$1
    export PGPASSWORD=$PGPASS
    psql -h 127.0.0.1 -U $PGUSER -c "DROP DATABASE IF EXISTS $db;" >/dev/null 2>&1
    psql -h 127.0.0.1 -U $PGUSER -c "CREATE DATABASE $db;" >/dev/null
}

function run_liquibase() {
    local db=$1
    local comp=$2
    local db_type=$3
    local url=""
    local user=""
    local pass=""
    
    if [ "$db_type" == "mariadb" ]; then
        url="$URL_MARIADB/$db"
        user="$USER"
        pass="$PASS"
    else
        url="$URL_POSTGRES/$db"
        user="$PGUSER"
        pass="$PGPASS"
    fi

    $LIQUIBASE --changelog-file=changelog.yaml \
               --url="$url" \
               --username="$user" \
               --password="$pass" \
               --search-path="liquibase/$comp/" \
               update > /dev/null 2>&1
}
