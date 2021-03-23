#!/bin/sh

adduser -S $FTP_USER -s /bin/ash
addgroup $FTP_USER
addgroup $FTP_USER $FTP_USER
echo $FTP_USER:$FTP_PASSWORD | chpasswd

sed -i -e 's/NODE_IP/'$NODE_IP'/g' /etc/vsftpd/vsftpd.conf

openrc

rc-update add vsftpd default
touch /run/openrc/softlevel

rc-service vsftpd restart
touch /var/log/vsftpd.log

telegraf &

tail -f /var/log/vsftpd.log
