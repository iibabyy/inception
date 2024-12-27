FROM alpine:3.20

WORKDIR /var/www/nginx

COPY . /var/www/nginx

RUN apk update \
&& apk cache clean
# && apk add nginx \

EXPOSE 9000
EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]