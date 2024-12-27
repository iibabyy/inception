FROM alpine:edge

WORKDIR /var/www/nginx

COPY . /var/www/nginx

RUN apk update \
apk cache clean

EXPOSE 9000
EXPOSE 443
