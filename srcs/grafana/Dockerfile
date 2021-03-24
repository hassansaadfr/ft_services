FROM alpine

ENV TELEGRAF_VERSION 1.18.0

RUN apk update

RUN apk add --no-cache --upgrade bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

ADD https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz ./

RUN tar -zxvf grafana-7.4.5.linux-amd64.tar.gz

COPY srcs/init.sh .

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz telegraf.tar.gz

RUN tar -C . -xzf telegraf.tar.gz
RUN mv telegraf-1.18.0/ telegraf
RUN chmod +x telegraf/usr/bin
RUN cp /telegraf/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf/

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY srcs/datasource.yaml /grafana-7.4.5/conf/provisioning/datasources/datasources.yaml
COPY srcs/dashboards /grafana-7.4.5/conf/provisioning/dashboards/data
COPY srcs/dashboard.yaml /grafana-7.4.5/conf/provisioning/dashboards/

RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

CMD ./init.sh
