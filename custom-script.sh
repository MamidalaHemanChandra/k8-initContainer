#!/bin/bash

if [ -f /tmp/mysql-root-password.txt ];then
    Password=$(cat /tmp/mysql-root-password.txt )
    echo "Mysql Password accessed"
else
    echo "Mysql Password not found"
    exit 1
fi

export MYSQL_ROOT_PASSWORD="$Password"
exec docker-entrypoint.sh mysqld