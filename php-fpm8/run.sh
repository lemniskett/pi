#!/usr/bin/env bash

exec docker run \
    -v /data/webroot:/data/webroot \
    -v pi:/tmp \
    --name php-fpm8-pi \
    php-fpm8-pi