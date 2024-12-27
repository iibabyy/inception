FROM alpine:3.20

WORKDIR /var/lib/mysql

COPY . /var/lib/mysql

RUN apk update \
&& apk add mariadb \
&& apk cache clean
# && apk add mariadb \

ENV MYSQL_PASSWORD=password
ENV MYSQL_ROOT_PASSWORD=secret

EXPOSE 3306

# CMD [ "rc-service", "mariadb", "start" ]