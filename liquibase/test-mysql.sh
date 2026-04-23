#!/usr/bin/env bash

mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS ccnet; CREATE DATABASE ccnet;"
liquibase --changelog-file=changelog.yaml --url="jdbc:mariadb://127.0.0.1:3306" --username="root" --password="password" --search-path="ccnet" update

mariadb -h 127.0.0.1 -u root -ppassword -e "DROP DATABASE IF EXISTS seafile; CREATE DATABASE seafile;"
liquibase --changelog-file=changelog.yaml --url="jdbc:mariadb://127.0.0.1:3306" --username="root" --password="password" --search-path="seafile" update
