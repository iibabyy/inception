FROM debian:bullseye


RUN apt update \
&& apt upgrade -y \
&& apt install php7.4 redis-server php7.4-redis

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf \
&& echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
