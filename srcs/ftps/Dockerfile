FROM alpine

ENV FTP_USER hsaadaou
ENV FTP_PASSWORD hsaadaou

RUN apk update

RUN apk add vsftpd

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /etc/ssl/private

RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=FR/ST=Paris/L=Paris/O=FTP K8s FT/OU=Saadaoui Hassan/CN=localhost"

COPY srcs/init.sh .

RUN chmod +x init.sh

RUN apk add openrc

CMD ./init.sh
