FROM alpine:edge

WORKDIR /var/www/db

COPY . /var/www/db

RUN apk update \
apk cache clean

EXPOSE 3306
