FROM alpine

ENV FTP_USER hsaadaou
ENV FTP_PASSWORD hsaadaou

RUN apk update

RUN apk add --no-cache --upgrade bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN apk add vsftpd

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /etc/ssl/private

RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=FR/ST=Paris/L=Paris/O=FTP K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN apk add openrc

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz telegraf.tar.gz

RUN tar -C . -xzf telegraf.tar.gz
RUN mv telegraf-1.18.0/ telegraf
RUN chmod +x telegraf/usr/bin
RUN cp /telegraf/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf/

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 20 21

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

CMD ./init.sh
