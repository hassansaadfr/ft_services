FROM hsaadaou/alpine_base

ENV SERVICE_NAME wordpress

RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer
RUN apk add nginx

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /wp-cli.phar
RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/wordpress

RUN wp core download --locale=fr_FR --path=/var/wordpress/

# COPY srcs/wp-config.php /var/wordpress

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN openrc
RUN touch /run/openrc/softlevel

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=Wordpress K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/init.sh /
RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .
RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

EXPOSE 5050

CMD ./init.sh
