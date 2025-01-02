#!/bin/bash

wp_install() {
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html

	cd /var/www/html
	tar -xzf wordpress-6.1.1.tar.gz
	rm wordpress-6.1.1.tar.gz
	chown -R www-data:www-data /var/www/*
	chmod -R 755 /var/www/*
}

wp_init() {

	cd /var/www/html/wordpress

	if ! wp core is-installed --allow-root; then

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
	fi

	echo wp installed
}

wait_for_db() {
    echo "Waiting for database connection..."
    until mysql -h "mariadb" -u "$SQL_USER" -p"$SQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
        echo "Database is not ready. Retrying in 5 seconds..."
        sleep 5
    done
    echo "Database is ready!"
}


wait_for_db

wp_install
wp_init

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec php-fpm7.4 --nodaemonize --allow-to-run-as-root
loop