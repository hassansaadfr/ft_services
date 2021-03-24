#!/bin/sh

# check if telegraf is running
if ! pgrep -x "telegraf" > /dev/null
then
        echo "telegraf down" >> /var/wordpress/livenessproblog.txt
    exit 1
fi

# check if nginx is running
if ! pgrep "nginx" > /dev/null
then
        echo "nginx down" >> /var/wordpress/livenessproblog.txt
        exit 1
fi

# check if php-fpm is running
if ! pgrep "php-fpm7" > /dev/null
then
        echo "php-fpm down" >> /var/wordpress/livenessproblog.txt
        exit 1
fi
