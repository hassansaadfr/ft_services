FROM hsaadaou/alpine_base

ENV SERVICE_NAME ftps
ENV FTP_USER hsaadaou
ENV FTP_PASSWORD hsaadaou

RUN apk add vsftpd

RUN mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=FR/ST=Paris/L=Paris/O=FTP K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/init.sh .
RUN chmod +x init.sh

COPY srcs/livenessprobe.sh .
RUN chmod +x livenessprobe.sh

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN sed  -i 's/SERVICE_NAME/'$SERVICE_NAME'/g' /etc/telegraf/telegraf.conf

EXPOSE 20 21 30020 30021 30022

CMD ./init.sh
