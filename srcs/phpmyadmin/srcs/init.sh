#!/bin/sh

php -S 0.0.0.0:5001 -t /tmp/phpMyAdmin-4.9.0.1-all-languages/ &

service nginx start

tail -f /var/log/nginx/*.log
