FROM alpine:edge

WORKDIR /app

COPY . /app

RUN apk update \
apk cache clean

EXPOSE 3306
EXPOSE 9000
