FROM debian:bullseye

RUN apt update \
&&	apt -y upgrade \
&&	apt install -y php php7.4-fpm php-mysql \
&&	apt install -y curl \
&&	apt install -y default-mysql-client mariadb-client

EXPOSE 9000

COPY ./tools/init_wp.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress

ENTRYPOINT [ "bash", "/init_wp.sh" ]