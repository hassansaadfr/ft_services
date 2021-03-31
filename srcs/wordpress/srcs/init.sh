#!/bin/sh

php-fpm7

service nginx start

wp config create --skip-check --allow-root --path=/var/wordpress/ --dbname=$WP_DB_NAME --dbuser=$ADMIN_WP_USER --dbpass=$ADMIN_WP_PASS --dbhost=mysql
wp core install --allow-root --path=/var/wordpress/ --url=https://$NODE_IP:5050 --title=ft_services --admin_user=$ADMIN_WP_USER --admin_password=$ADMIN_WP_PASS --admin_email=$ADMIN_WP_USER@$ADMIN_WP_USER.com
wp plugin install log-emails disable-emails --activate --path=/var/wordpress/
wp user create --path=/var/wordpress/ $USER1_WP_USER $USER1_WP_USER@$USER1_WP_USER.com --role=author --user_pass=$USER1_WP_PASS
wp user create --path=/var/wordpress/ $USER2_WP_USER $USER2_WP_USER@$USER2_WP_USER.com --role=author --user_pass=$USER2_WP_PASS

telegraf &

tail -f /var/log/nginx/*.log
