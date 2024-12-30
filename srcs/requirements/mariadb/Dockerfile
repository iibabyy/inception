FROM debian:bullseye


RUN apt update \
&& apt upgrade -y \
&& apt install -y mariadb-server \
&& mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld

COPY ./tools/init_db.sh /
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /init_db.sh

ENTRYPOINT [ "bash", "/init_db.sh" ]