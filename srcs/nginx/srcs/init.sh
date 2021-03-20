#!/bin/sh

service nginx start
/usr/sbin/sshd

tail -f /var/log/nginx/*.log
