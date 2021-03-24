FROM alpine

ENV VER "4.9.0.1"

ENV NODE_IP localhost

EXPOSE 5000

RUN apk update

RUN apk add --no-cache --upgrade bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN apk add curl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer

RUN apk add wget openrc nginx

RUN apk add phpmyadmin

COPY ./srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN openrc

RUN touch /run/openrc/softlevel

EXPOSE 5050

RUN apk add openrc

RUN apk add openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=PMA K8s FT/OU=Saadaoui Hassan/CN=localhost"

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz telegraf.tar.gz

RUN tar -C . -xzf telegraf.tar.gz
RUN mv telegraf-1.18.0/ telegraf
RUN chmod +x telegraf/usr/bin
RUN cp /telegraf/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf/

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY srcs/init.sh .

RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

CMD ./init.sh
