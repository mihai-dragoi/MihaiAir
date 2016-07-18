#!/usr/bin/env bash

until mysqladmin -uroot -proot -h mihaiairdb.local ping; do
    echo "$(date) - waiting for mysql"
    sleep 3
done

echo "Check DB mihaiair ?"

if ! mysql -uroot -proot -h mihaiairdb.local -e 'use mihaiair'; then
    mysql -uroot -proot -h mihaiairdb.local -e "create database mihaiair;"
    mysql -uroot -proot -h mihaiairdb.local mihaiair < mihaiair_2016-07-18.sql
    echo >&2 "DB created"
else
    echo "DB exist."
fi

/usr/bin/supervisord

