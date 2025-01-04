#!/bin/bash

##		FUNCTIONS		##

start() {
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
	mkdir -p /run/php

	exec php-fpm7.4 --nodaemonize --allow-to-run-as-root
}

wp_install() {
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
	chmod +x /usr/local/bin/wp

	chmod -R 755 /var/www/html/wordpress/
	chown -R www-data:www-data /var/www/html/wordpress
}

wp_init() {

	wp_install

	cd /var/www/html/wordpress

	echo "downloading wp..."
	wp core download --allow-root

	echo "Creating wp-config.php..."
	wp config create --allow-root \
		--dbname="$SQL_DATABASE" \
		--dbpass="$SQL_PASSWORD" \
		--dbuser="$SQL_USER" \
		--dbhost="$WP_DB_HOST" \
		--url="http://$DOMAIN_NAME";


	echo "Installing WordPress..."
	wp core install --allow-root \
		--title="$SITE_TITLE" \
		--admin_user="$ADMIN_USER" \
		--admin_password="$ADMIN_PASSWORD" \
		--admin_email="$ADMIN_EMAIL" \
		--url="http://$DOMAIN_NAME" \
		--skip-email;

	echo "Creating new user..."
		wp user create --allow-root \
		"$USER_LOGIN" "$USER_EMAIL" \
		--role=author \
		--user_pass="$USER_PASSWORD";

	wp plugin install redis-cache --activate --allow-root
	wp config set WP_CACHE true --add
	wp config set WP_REDIS_HOST redis --add
	wp config set WP_REDIS_PORT 6379 --add
	wp redis enable

}

wait_for_db() {
    echo "Waiting for database connection..."
    until mysql -h "mariadb" -u "$SQL_USER" -p"$SQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
        echo "Database is not ready. Retrying in 5 seconds..."
        sleep 5
    done
    echo "Database is ready!"
}



##		Starting	##

wait_for_db
wp_init
start
