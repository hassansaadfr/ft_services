FROM hsaadaou/alpine_base

ENV SERVICE_NAME ftps
ENV FTP_USER hsaadaou
ENV FTP_PASSWORD hsaadaou

RUN apk add vsftpd

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /etc/ssl/private

RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=FR/ST=Paris/L=Paris/O=FTP K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/init.sh .

RUN chmod +x init.sh

EXPOSE 20 21

COPY srcs/livenessprobe.sh .

RUN chmod +x livenessprobe.sh

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

CMD ./init.sh
