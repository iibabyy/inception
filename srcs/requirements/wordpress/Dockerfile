FROM debian:bullseye

RUN apt update 
RUN	apt -y upgrade 
RUN	apt install -y php php7.4-fpm php-mysql 
RUN	apt install -y curl 
RUN	apt install -y default-mysql-client mariadb-client 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp 
RUN mkdir -p /run/php 
RUN mkdir -p /var/www/html/wordpress 
RUN chown -R www-data:www-data /var/www/html/wordpress 
RUN chmod -R 755 /var/www/html/wordpress

EXPOSE 9000

COPY ./tools/init_wp.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress

ENTRYPOINT [ "bash", "/init_wp.sh" ]