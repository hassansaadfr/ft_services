FROM hsaadaou/alpine_base

ENV SERVICE_NAME influxdb

RUN apk add influxdb

RUN openrc
RUN touch /run/openrc/softlevel

COPY srcs/init.sh .
RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .
RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf
RUN sed  -i 's/influxdb:8086/127.0.0.1:8086/g' /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD ./init.sh
