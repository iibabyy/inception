#!/bin/bash

wp_init() {
	# 	mkdir -p /var/www/html/wordpress
	cd /var/www/html/wordpress || exit 1

	if ! wp core is-installed --allow-root; then

		echo "Creating wp-config.php..."
		wp config create --allow-root \
			--dbname="$MYSQL_DATABASE" \
			--dbpass="$MYSQL_PASSWORD" \
			--dbuser="$MYSQL_USER" \
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
}

wait_for_db() {
    echo "Waiting for database connection..."
    until mysql -h "mariadb" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
        echo "Database is not ready. Retrying in 5 seconds..."
        sleep 5
    done
    echo "Database is ready!"
}


wait_for_db

wp_init

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec php-fpm7.4 --nodaemonize --allow-to-run-as-root
loop