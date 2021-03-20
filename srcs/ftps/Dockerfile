FROM alpine

RUN apk add openssh-server

COPY srcs/sshd_config /etc/ssh/sshd_config

RUN addgroup sftp

RUN mkdir -p /home/user
RUN adduser -s /bin/false -h /home/user -G sftp user -D

RUN chown root:root /home/user/
RUN chmod -R 770 /home/user

ENTRYPOINT [ "sh" ]
