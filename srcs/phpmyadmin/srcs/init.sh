#!/bin/sh

php -S 0.0.0.0:5001 -t /usr/share/webapps/phpmyadmin &

service nginx start

tail -f /var/log/nginx/*.log
