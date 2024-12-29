#!/bin/bash

wp_init() {
	if [ -f wp-config.php ]; then
		echo "Removing existing wp-config.php..."
		rm wp-config.php
	fi

	echo "Creating wp-config.php..."
	wp config create --allow-root \
		--dbname="$MYSQL_DATABASE" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbuser="$MYSQL_USER" \
		--dbhost="$MYSQL_HOST" \
		--url="http://$DOMAIN_NAME" || exit 1

    if ! wp core is-installed --allow-root; then
        echo "Installing WordPress..."
        wp core install --allow-root \
            --title="$SITE_TITLE" \
            --admin_user="$ADMIN_USER" \
            --admin_password="$ADMIN_PASSWORD" \
            --admin_email="$ADMIN_EMAIL" \
            --url="http://$DOMAIN_NAME" \
            --skip-email || exit 1
    else
        echo "WordPress is already installed. Skipping installation."
    fi

    if ! wp user get "$USER_LOGIN" --allow-root > /dev/null 2>&1; then
        echo "Creating new user..."
        wp user create --allow-root \
            "$USER_LOGIN" "$USER_EMAIL" \
            --role=author \
            --user_pass="$USER_PASSWORD" || exit 1
    else
        echo "User $USER_LOGIN already exists. Skipping user creation."
    fi

}

wait_for_db() {
    echo "Waiting for database connection..."
    until mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
        echo "Database is not ready. Retrying in 5 seconds..."
        sleep 5
    done
    echo "Database is ready!"
}

cd /var/www/html/

wait_for_db
wp_init

exec php-fpm8.2 --nodaemonize --allow-to-run-as-root
