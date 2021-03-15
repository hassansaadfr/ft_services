#/!bin/bash
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql" --no-watch

until echo "show databases;" | mysql -u root --skip-password
do
	clear
	echo "mysql is not up"
done

echo "CREATE USER 'wp'@'localhost' IDENTIFIED BY 'wp';" | mysql -u root --skip-password
echo "CREATE DATABASE wordpress CHARACTER SET utf8 COLLATE utf8_bin;" | mysql -u root --skip-password
echo "GRANT ALL on wordpress.* TO 'wp'@'localhost' IDENTIFIED BY 'wp';" | mysql -u root --skip-password
echo "flush privileges;" | mysql -u root --skip-password

sh
