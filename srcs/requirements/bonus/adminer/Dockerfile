FROM debian:bullseye

COPY ./tools/init_adminer.sh /

RUN apt-get update \
&& apt-get install -y wget php php-mysql php7.4-fpm \
&& mkdir -p /var/www/html/ \
&& chmod +x /init_adminer.sh

ENTRYPOINT ["/init_adminer.sh"]