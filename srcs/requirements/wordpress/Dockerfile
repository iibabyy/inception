FROM debian:stable

RUN apt update  \
&& apt -y upgrade \
&& apt install -y php \
&& apt install -y php-fpm \
&& apt install -y php-mysql \
&& apt install -y default-mysql-client \
&& apt install -y mariadb-client \
&& apt install -y wget \
&& wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/ \
&& tar -xzf /var/www/wordpress-6.1.1.tar.gz \
&& rm /var/www/wordpress-6.1.1.tar.gz /var/www/html -rf \
&& mv /var/www/wordpress /var/www/html

ENV DOMAIN_NAME="ibaby"

WORKDIR /app

COPY . /app

EXPOSE 9000

# ENTRYPOINT [ "?" ]