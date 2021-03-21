FROM alpine

RUN apk update

RUN apk add --no-cache --upgrade bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN apk add nginx

RUN apk add openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=Nginx K8s FT/OU=Saadaoui Hassan/CN=localhost"

RUN apk add openrc

EXPOSE 80 443

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN openrc

RUN touch /run/openrc/softlevel

COPY srcs/proxy_params /etc/nginx/proxy_params

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN apk add openssh

RUN ssh-keygen -A

ENV SSH_USER hsaadaou
ENV SSH_PASSWORD hsaadaou

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz telegraf.tar.gz

RUN tar -C . -xzf telegraf.tar.gz
RUN mv telegraf-1.18.0/ telegraf
RUN chmod +x telegraf/usr/bin
RUN cp /telegraf/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf/

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD ./init.sh
