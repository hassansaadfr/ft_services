FROM hsaadaou/alpine_base

ENV SERVICE_NAME influxdb

RUN apk add influxdb

RUN openrc

RUN touch /run/openrc/softlevel

COPY srcs/init.sh .

RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

CMD ./init.sh
