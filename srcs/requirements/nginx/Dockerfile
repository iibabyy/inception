FROM debian:bullseye

RUN apt update \
&& apt upgrade -y \
&& apt install -y nginx \
&& apt install -y openssl \
&& openssl req -x509 -nodes -out /etc/ssl/certs/ibaby.42.crt -keyout /etc/ssl/private/ibaby.42.key -subj "/C=FR/ST=IDF/L=Paris/O=idrissa/OU=42/CN=ibaby.42.fr" \
&& openssl req -x509 -nodes -out /etc/ssl/certs/portfolio.crt -keyout /etc/ssl/private/portfolio.key -subj "/C=FR/ST=IDF/L=Paris/O=idrissa/OU=42/CN=myportfolio.com" \
&& mkdir -p /var/run/nginx \
&& mkdir -p /var/www/html/wordpress \
&& chown -R www-data:www-data /var/www/html/wordpress \
&& chmod 755 /var/www/html/wordpress \
&& mkdir -p /var/www/html/portfolio \
&& chown -R www-data:www-data /var/www/html/portfolio \
&& chmod 755 /var/www/html/portfolio

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]