FROM debian:bullseye


RUN apt update \
	&& apt upgrade -y \
	&& apt install -y redis

COPY conf/redis.conf /etc/redis/

CMD [ "redis-server", "--protected-mode", "no" ]