FROM hsaadaou/alpine_base

ENV SERVICE_NAME mysql

RUN apk add mariadb mariadb-common mariadb-client

COPY srcs/init.sh .

RUN chmod +x init.sh

COPY srcs/init_db.sh init_db.sh

RUN chmod +x init_db.sh

ENV MYSQL_ROOT_PASSWORD=root

ENV ADMIN_WP_USER ADMIN_WP_USER
ENV USER1_WP_USER USER1_WP_USER
ENV USER2_WP_USER USER2_WP_USER

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

CMD "./init.sh"
