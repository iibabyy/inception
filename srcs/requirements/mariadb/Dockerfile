FROM debian:bullseye


RUN apt update \
&& apt upgrade -y \
&& apt install -y mariadb-server mariadb-client \
&& mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld

RUN mkdir -p /run/mysqld /var/run/mysqld /var/lib/mysql /var/log/mysql \
&& chown -R mysql:mysql /run/mysqld /var/run/mysqld /var/lib/mysql /var/log/mysql \
&& chmod -R 750 /run/mysqld /var/run/mysqld /var/log/mysql /var/lib/mysql

COPY ./tools/init_db.sh /
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

RUN chmod +x /init_db.sh \
&& chown mysql:mysql /init_db.sh \
&& chown mysql:mysql /etc/mysql/mariadb.cnf

EXPOSE 3306

ENTRYPOINT [ "bash", "/init_db.sh" ]
