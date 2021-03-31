FROM hsaadaou/alpine_base

ENV SERVICE_NAME mysql
ENV WP_DB_NAME WP_DB_NAME
ENV MYSQL_ROOT_PASSWORD MYSQL_ROOT_PASSWORD
ENV ADMIN_WP_USER ADMIN_WP_USER
ENV USER1_WP_USER USER1_WP_USER
ENV USER2_WP_USER USER2_WP_USER

RUN apk add mariadb mariadb-common mariadb-client

COPY srcs/init.sh .
RUN chmod +x init.sh

COPY srcs/init_db.sh init_db.sh
RUN chmod +x init_db.sh

COPY srcs/livenessprobe.sh .
RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

EXPOSE 3306

CMD "./init.sh"
