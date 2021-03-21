#!/bin/sh

sed -i -e 's/node_ip/'$NODE_IP'/g' /usr/share/webapps/phpmyadmin/config.inc.php

php-fpm7

service nginx start

telegraf &

tail -f /var/log/nginx/*.log
