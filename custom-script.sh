#!/bin/bash

if [ -f /tmp/mysql-root-password.txt ];then
    PASSWORD=$(cat /tmp/mysql-root-password.txt)
    echo "Accessing Mysql root password"
else
    echo "Mysql root password not found"
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm -rf /tmp/mysql-root-password.txt
exec /entrypoint.sh mysqld