FROM alpine

EXPOSE 5050

RUN apk update

RUN apk add curl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/wordpress && cd /var/wordpress && wp core download --locale=fr_FR

COPY srcs/wp-config.php /var/wordpress

RUN apk add nginx

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN apk add openrc

RUN openrc

RUN touch /run/openrc/softlevel

RUN apk add openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=Wordpress K8s FT/OU=Saadaoui Hassan/CN=localhost"

EXPOSE 5050

COPY srcs/init.sh /
RUN chmod +x init.sh

CMD ./init.sh
