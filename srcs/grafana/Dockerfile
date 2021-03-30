FROM hsaadaou/alpine_base

ENV SERVICE_NAME grafana

ADD https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz ./

RUN tar -zxvf grafana-7.4.5.linux-amd64.tar.gz

COPY srcs/init.sh .

COPY srcs/datasource.yaml /grafana-7.4.5/conf/provisioning/datasources/datasources.yaml
COPY srcs/dashboards /grafana-7.4.5/conf/provisioning/dashboards/data
COPY srcs/dashboard.yaml /grafana-7.4.5/conf/provisioning/dashboards/

RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

CMD ./init.sh
