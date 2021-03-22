#!/bin/sh

sed -i -e 's/NODE_IP/'$NODE_IP'/g' /landing/index.html
sed -i -e 's/SSH_USER/'$SSH_USER'/g' /landing/index.html
sed -i -e 's/SSH_PASSWORD/'$SSH_PASSWORD'/g' /landing/index.html
sed -i -e 's/FTP_USER/'$FTP_USER'/g' /landing/index.html
sed -i -e 's/FTP_PASSWORD/'$FTP_PASSWORD'/g' /landing/index.html
sed -i -e 's/MYSQL_ROOT_PASSWORD/'$MYSQL_ROOT_PASSWORD'/g' /landing/index.html
sed -i -e 's/ADMIN_WP_USER/'$ADMIN_WP_USER'/g' /landing/index.html
sed -i -e 's/ADMIN_WP_PASS/'$ADMIN_WP_PASS'/g' /landing/index.html
sed -i -e 's/USER1_WP_USER/'$USER1_WP_USER'/g' /landing/index.html
sed -i -e 's/USER1_WP_PASS/'$USER1_WP_PASS'/g' /landing/index.html
sed -i -e 's/USER2_WP_USER/'$USER2_WP_USER'/g' /landing/index.html
sed -i -e 's/USER2_WP_PASS/'$USER2_WP_PASS'/g' /landing/index.html



