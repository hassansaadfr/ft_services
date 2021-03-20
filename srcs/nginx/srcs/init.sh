#!/bin/sh

adduser -S $SSH_USER -s /bin/ash
addgroup $SSH_USER
addgroup $SSH_USER $SSH_USER
echo $SSH_USER:$SSH_PASSWORD | chpasswd

service nginx start
/usr/sbin/sshd

wp core install --allow-root --path=/tmp/wordpress/ --url=https://$NODE_IP/wordpresss --title=ft_services --admin_user=$ADMIN_WP_USER --admin_password=$ADMIN_WP_PASS --admin_email=$ADMIN_WP_USER@$ADMIN_WP_USER.com

tail -f /var/log/nginx/*.log
