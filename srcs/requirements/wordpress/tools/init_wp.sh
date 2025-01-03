#!/bin/bash

wp_install() {
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	# curl -O https://wordpress.org/wordpress-6.1.1.tar.gz
	# tar -xzf wordpress-6.1.1.tar.gz
	# rm wordpress-6.1.1.tar.gz
	# mv wordpress /var/www/html/wordpress

	chmod -R 755 /var/www/html/wordpress/
	chown -R www-data:www-data /var/www/html/wordpress

	# find /var/www/html/wordpress/ -mindepth 1 -delete

	# chown -R www-data:www-data /var/www/*
	# chmod -R 755 /var/www/*
}

wp_init() {

	cd /var/www/html/wordpress

	# if ! wp core is-installed --allow-root; then

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
	# fi

}

wait_for_db() {
    echo "Waiting for database connection..."
    until mysql -h "mariadb" -u "$SQL_USER" -p"$SQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
        echo "Database is not ready. Retrying in 5 seconds..."
        sleep 5
    done
    echo "Database is ready!"
}

sleep 5
wait_for_db

echo "[========WP INSTALLATION STARTED========]"

wp_install
sleep 5
wp_init

echo "[=======WP INSTALLATION FINISHED=========]"

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

echo "[=======Executing php=========]"
exec php-fpm7.4 --nodaemonize --allow-to-run-as-root