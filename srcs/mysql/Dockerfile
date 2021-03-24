FROM alpine

RUN apk update

RUN apk add --no-cache --upgrade bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN apk add mariadb mariadb-common mariadb-client

COPY srcs/init.sh .

RUN chmod +x init.sh

COPY srcs/init_db.sh init_db.sh

RUN chmod +x init_db.sh

ENV MYSQL_ROOT_PASSWORD=root

ENV ADMIN_WP_USER ADMIN_WP_USER
ENV USER1_WP_USER USER1_WP_USER
ENV USER2_WP_USER USER2_WP_USER

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz telegraf.tar.gz

RUN tar -C . -xzf telegraf.tar.gz
RUN mv telegraf-1.18.0/ telegraf
RUN chmod +x telegraf/usr/bin
RUN cp /telegraf/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf/

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

CMD "./init.sh"
