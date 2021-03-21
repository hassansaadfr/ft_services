#/!bin/sh
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql" --no-watch

until echo "show databases;" | mysql -u root -p'$MYSQL_ROOT_PASSWORD'
do
	clear
	echo "mysql is not up"
done

./init_db.sh

telegraf &

tail -F /tmp/mysql.log
