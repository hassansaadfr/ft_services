FROM alpine

EXPOSE 5050

RUN apk update

RUN apk add curl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN apk add wget

RUN cd /tmp && mkdir wordpress && cd wordpress && wget https://wordpress.org/latest.tar.gz && tar xfz latest.tar.gz && mv wordpress/* ./ && rm -rf *.gz

COPY srcs/wp-config.php /tmp/wordpress

RUN apk add openrc

RUN apk add nginx

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN openrc

RUN touch /run/openrc/softlevel

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN apk add openrc

EXPOSE 5050

CMD ./init.sh
