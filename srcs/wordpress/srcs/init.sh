#!/bin/sh

php-fpm7

service nginx start

tail -f /var/log/nginx/*.log
