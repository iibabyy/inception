FROM nginx

RUN apt update \
&& apt upgrade -y \
&& apt install -y nginx \
&& apt install -y openssl \
&& openssl req -x509 -nodes -out /etc/ssl/certs/ibaby.42.crt -keyout /etc/ssl/private/ibaby.42.key -subj "/C=FR/ST=IDF/L=Paris/O=idrissa/OU=42/CN=ibaby.42.fr" \
&& mkdir -p /var/run/nginx \
&& mkdir -p /var/www/html/wordpress \
&& chown -R www-data:www-data /var/www/html/wordpress \
&& chmod 755 /var/www/html/wordpress

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]