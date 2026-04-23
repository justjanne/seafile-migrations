#!/usr/bin/env bash
./mysql-legacy.sh ccnet
./mysql-test.sh ccnet
./pgsql-legacy.sh ccnet
./pgsql-test.sh ccnet
