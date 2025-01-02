FROM debian:bullseye

RUN apt update \
&& apt install -y nginx \
&& apt install -y openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -out /etc/ssl/certs/ibaby.42.crt -keyout /etc/ssl/private/ibaby.42.key -subj "/C=FR/ST=IDF/L=Paris/O=rayan/OU=42/CN=ibaby.42.fr"

RUN chmod 755 /var/www/html \
&& chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]