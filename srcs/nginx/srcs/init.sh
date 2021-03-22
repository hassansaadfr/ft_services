#!/bin/sh

./init_landing.sh

adduser -S $SSH_USER -s /bin/ash
addgroup $SSH_USER
addgroup $SSH_USER $SSH_USER
echo $SSH_USER:$SSH_PASSWORD | chpasswd

service nginx start
/usr/sbin/sshd

telegraf &

tail -f /var/log/nginx/*.log
