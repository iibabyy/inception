FROM debian:bullseye

RUN apt-get update \
&& apt-get install -y curl php php-mysql php7.4-fpm \
&& mkdir -p /var/www/html/adminer

RUN curl -o /var/www/html/index.php https://www.adminer.org/latest.php

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "--nodaemonize"]