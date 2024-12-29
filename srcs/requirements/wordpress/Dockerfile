FROM debian:stable

RUN apt update  \
&& apt -y upgrade \
&& apt install -y php8.2 \
&& apt install -y php-fpm \
&& apt install -y php-mysql \
&& apt install -y default-mysql-client \
&& apt install -y mariadb-client \
&& apt install -y wget \
&& cd /var/www/html \
&& wget https://wordpress.org/latest.tar.gz \
&& tar -xzf latest.tar.gz \
&& rm latest.tar.gz -rf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

EXPOSE 9000

COPY ./tools/init_wp.sh /
ENTRYPOINT [ "bash", "/init_wp.sh" ]