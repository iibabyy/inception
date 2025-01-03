FROM debian:bullseye

COPY ./tools/init_adminer.sh /

RUN apt update \
&& apt -y upgrade \
&& apt install -y curl php php-mysql \
&& chmod +x /init_adminer.sh

ENTRYPOINT ["/init_adminer.sh"]