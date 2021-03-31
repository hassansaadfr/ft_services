#!/bin/sh

# -- Create Database
echo "CREATE DATABASE $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_bin;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# -- Create admin
echo "CREATE USER '$ADMIN_WP_USER'@'%' IDENTIFIED BY '$ADMIN_WP_PASS';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# -- Add rights to admin
echo "GRANT ALL on $WP_DB_NAME.* TO '$ADMIN_WP_USER'@'%' IDENTIFIED BY '$ADMIN_WP_PASS';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# -- Allow connection to root user from any location

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY ''$MYSQL_ROOT_PASSWORD'';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# -- Reload the grant table
echo "flush privileges;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'

# -- Enable logs in file
echo "SET GLOBAL log_output = 'FILE';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
echo "SET GLOBAL general_log_file = '/tmp/mysql.log';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
echo "SET GLOBAL general_log = 'ON';" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
