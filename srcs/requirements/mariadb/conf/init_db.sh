#!/bin/sh

mysqld_safe &

sleep 2

mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS $DB_USER@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown;

exec mysqld_safe
