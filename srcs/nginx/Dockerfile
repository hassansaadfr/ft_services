FROM alpine

RUN apk update

RUN apk add nginx

RUN apk add openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=WP Docker FT/OU=Saadaoui Hassan/CN=localhost"

# COPY init.sh .

# RUN chmod +x init.sh

CMD sh
