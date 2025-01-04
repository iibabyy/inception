#!bin/bash

wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php 
chown -R www-data:www-data /var/www/html/index.php 
chmod 755 /var/www/html/index.php

cd /var/www/html

# -S to run with a built-in web server
php -S 0.0.0.0:80