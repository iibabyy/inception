#!/bin/bash

wget -q "http://www.adminer.org/latest.php" -O /var/www/html/index.php 
chown -R www-data:www-data /var/www/html/index.php 
chmod 755 /var/www/html/index.php

cd /var/www/html

exec php -S 0.0.0.0:80