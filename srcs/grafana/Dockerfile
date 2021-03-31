FROM hsaadaou/alpine_base

ENV SERVICE_NAME grafana

ADD https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz ./
RUN tar -zxvf grafana-7.4.5.linux-amd64.tar.gz

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=Grafana K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/datasource.yaml /grafana-7.4.5/conf/provisioning/datasources/datasources.yaml
COPY srcs/dashboards /grafana-7.4.5/conf/provisioning/dashboards/data
COPY srcs/dashboard.yaml /grafana-7.4.5/conf/provisioning/dashboards/

COPY srcs/init.sh .
RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .
RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

COPY srcs/defaults.ini grafana-7.4.5/conf/defaults.ini

RUN rm -rf grafana-7.4.5.linux-amd64.tar.gz

EXPOSE 3000

CMD ./init.sh
