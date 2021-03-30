FROM hsaadaou/alpine_base

ENV SERVICE_NAME phpmyadmin

ENV NODE_IP localhost

RUN apk add curl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer

RUN apk add nginx

RUN apk add phpmyadmin

COPY ./srcs/config.inc.php /usr/share/webapps/phpmyadmin/config.inc.php

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN openrc

RUN touch /run/openrc/softlevel

EXPOSE 5000

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=PMA K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/init.sh .

RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

CMD ./init.sh
