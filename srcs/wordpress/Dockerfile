FROM alpine

EXPOSE 5050

RUN apk update

RUN apk add curl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN cd /tmp && mkdir wordpress && cd wordpress && wp core download --locale=fr_FR

COPY init.sh .

RUN chmod +x init.sh

COPY wp-config.php /tmp/wordpress

EXPOSE 5050

CMD ./init.sh
