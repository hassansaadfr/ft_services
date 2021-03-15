FROM alpine

RUN apk update

RUN apk add mariadb mariadb-common mariadb-client

COPY init.sh .

RUN chmod +x init.sh

CMD "./init.sh"
