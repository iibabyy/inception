FROM debian:bullseye

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

COPY ./conf/authorized_keys /root/.ssh/authorized_keys

RUN chmod 600 /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
