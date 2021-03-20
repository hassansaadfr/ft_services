#!/bin/sh

sed -i -e 's/node_ip/'$PMA_IP'/g' /usr/share/webapps/phpmyadmin/config.inc.php

php-fpm7

service nginx start

tail -f /var/log/nginx/*.log
