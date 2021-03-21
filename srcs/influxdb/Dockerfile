FROM alpine

RUN apk update

RUN apk add openrc

RUN apk add influxdb

RUN openrc

RUN touch /run/openrc/softlevel

COPY srcs/init.sh .

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz telegraf.tar.gz

RUN tar -C . -xzf telegraf.tar.gz
RUN mv telegraf-1.18.0/ telegraf
RUN chmod +x telegraf/usr/bin
RUN cp /telegraf/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf/

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod +x init.sh

CMD ./init.sh
