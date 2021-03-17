#!/bin/sh

php -S 0.0.0.0:5051 -t /tmp/wordpress &

service nginx start

tail -f /var/log/nginx/*.log
