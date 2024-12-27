FROM alpine:3.20

WORKDIR /app

COPY . /app

RUN apk update \
&& apk add nginx \
&& apk cache clean

EXPOSE 3306
EXPOSE 9000

CMD [ "nginx", "-g", "daemon off;" ]