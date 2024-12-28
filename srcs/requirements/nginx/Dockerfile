FROM nginx:stable-alpine

# WORKDIR /var/www/nginx

# COPY . /var/www/nginx

RUN docker-php-ext-install mysqli
# && apk add nginx \

# EXPOSE 9000
# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]