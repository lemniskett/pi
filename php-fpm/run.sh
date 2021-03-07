#!/usr/bin/env bash

exec docker run \
    -v /data/webroot:/data/webroot \
    -v /data/config/php-fpm/php.ini:/etc/php8/php.ini \
    -v /data/config/php-fpm/php-fpm.d:/etc/php8/php-fpm.d \
    --network pi \
    --ip 10.0.0.3 \
    --name php-fpm \
    l-php-fpm &