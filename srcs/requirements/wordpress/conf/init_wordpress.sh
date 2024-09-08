#!/bin/sh

sleep 10

wordpress_path="/var/www/html/wordpress"

if [ ! -f /var/www/html/wp-config.php ];
then
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=mariadb:3306 \
        --path=$wordpress_path
    
    wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USERNAME \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --path=$wordpress_path
    
    wp user create --allow-root \
        $WP_USER_USERNAME \
        $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASSWORD \
        --path=$wordpress_path
fi

/usr/sbin/php-fpm8.3 -F
