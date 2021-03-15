FROM alpine

RUN apk update

RUN apk add curl php composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

RUN wp core download --locale=fr_FR --path="/var/www/html/wordpress"

CMD "sh"
