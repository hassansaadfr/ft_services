FROM alpine

ENV VER="4.9.0.1"

ENV PMA_IP=localhost

EXPOSE 5000

RUN apk update

RUN apk add curl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer

RUN apk add wget openrc nginx

RUN apk add phpmyadmin

COPY ./srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN openrc

RUN touch /run/openrc/softlevel

EXPOSE 5050

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN apk add openrc

CMD ./init.sh
