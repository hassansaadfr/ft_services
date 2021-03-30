FROM hsaadaou/alpine_base

ENV SERVICE_NAME influxdb

RUN apk add influxdb

RUN openrc

RUN touch /run/openrc/softlevel

COPY srcs/init.sh .

RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

RUN sed -e -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

CMD ./init.sh
