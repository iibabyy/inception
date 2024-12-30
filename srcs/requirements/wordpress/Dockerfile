# FROM debian:bullseye

# # Met à jour le système et installe les dépendances nécessaires
# RUN apt-get update -y && apt-get upgrade -y && \
#     apt-get install -y wget curl gnupg mariadb-client default-mysql-client unzip && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# # Telechargement de PHP
# RUN apt-get update -y && \
#     apt-get install -y php7.4 php7.4-fpm php7.4-mysql && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# # Création du répertoire pour PHP-FPM PID
# RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# # Téléchargement et installation de WP-CLI
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp

# # Téléchargement de WordPress
# RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html && \
#     cd /var/www/html && \
#     tar -xzf wordpress-6.1.1.tar.gz && \
#     rm wordpress-6.1.1.tar.gz && \
#     chown -R www-data:www-data /var/www/html/wordpress && \
#     chmod -R 755 /var/www/html/wordpress

# # Configuration PHP-FPM
# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# # Ajout du script de démarrage
# COPY ./tools/init_wp.sh /init_wp.sh
# RUN chmod +x /init_wp.sh

# EXPOSE 9000

# ENTRYPOINT ["bash", "/init_wp.sh"]












FROM debian:bullseye

RUN apt update \
&&	apt -y upgrade \
&&	apt install -y php php7.4-fpm php-mysql \
&&	apt install -y wget \
&&	mkdir -p /var/www/html/wordpress \
&&	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&	chmod +x wp-cli.phar \
&&	mv wp-cli.phar /usr/local/bin/wp \
&&	apt install -y default-mysql-client mariadb-client \
&&	wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html \
&&	cd /var/www/html \
&&	tar -xzf /var/www/html/wordpress-6.1.1.tar.gz \
&&	rm /var/www/html/wordpress-6.1.1.tar.gz



EXPOSE 9000

COPY ./tools/init_wp.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT [ "bash", "/init_wp.sh" ]