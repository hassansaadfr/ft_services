FROM alpine

EXPOSE 5050

RUN apk update

RUN apk add curl php composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --locale=fr_FR

# CMD [ "php -S localhost:5050" ]
