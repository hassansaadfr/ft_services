FROM alpine

RUN apk update

RUN apk add nginx

RUN apk add openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=WP Docker FT/OU=Saadaoui Hassan/CN=localhost"

RUN apk add openrc

EXPOSE 80 443

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN openrc

RUN touch /run/openrc/softlevel

CMD ./init.sh
