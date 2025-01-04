FROM debian:bullseye

COPY ./tools/init_adminer.sh /

RUN apt-get update \
&& apt-get install -y wget php php-mysql php7.4-fpm \
&& mkdir -p /var/www/html/ \
&& chmod +x /init_adminer.sh

# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf \
# && mkdir -p /run/php

ENTRYPOINT ["/init_adminer.sh"]
# CMD ["php-fpm7.4", "--nodaemonize"]