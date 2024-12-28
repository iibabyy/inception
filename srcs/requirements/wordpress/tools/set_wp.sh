#!/bin/bash

init() {
	wp config create \
	--dbname=wordpress \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD

	wp core install \
	--url=$DOMAIN_NAME
}


