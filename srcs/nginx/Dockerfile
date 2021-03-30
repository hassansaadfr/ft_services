FROM hsaadaou/alpine_base

ENV SERVICE_NAME nginx

RUN apk add nginx

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=Nginx K8s FT/OU=Saadaoui Hassan/CN=localhost"

EXPOSE 80 443

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN openrc

RUN touch /run/openrc/softlevel

COPY srcs/proxy_params /etc/nginx/proxy_params

COPY srcs/default /etc/nginx/conf.d/default.conf

RUN apk add openssh

RUN ssh-keygen -A

ENV SSH_USER hsaadaou
ENV SSH_PASSWORD hsaadaou

COPY srcs/landing /landing

COPY srcs/init_landing.sh .

RUN chmod +x init_landing.sh

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

RUN sed -e -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

CMD ./init.sh
