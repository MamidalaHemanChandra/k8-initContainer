#!/bin/bash
set -e

PASSWORD_FILE="/tmp/mysql-root-password.txt"

if [ -f "$PASSWORD_FILE" ]; then
    export MYSQL_ROOT_PASSWORD=$(cat "$PASSWORD_FILE")
    echo "MySQL root password loaded successfully"
    rm -f "$PASSWORD_FILE"
else
    echo "ERROR: Password file not found"
    exit 1
fi

# Start official MySQL entrypoint
exec /usr/local/bin/docker-entrypoint.sh mysqld