#!/usr/bin/env bash

exec docker run \
    -v /data/webroot:/data/webroot \
    -v /data/config/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v /data/config/nginx/servers:/etc/nginx/servers \
    -v /data/config/php-fpm/php.ini:/etc/php8/php.ini \
    -v /data/config/php-fpm/php-fpm.d:/etc/php8/php-fpm.d \
    -v /data/postgres:/data/postgres \
    -v /data/config/postgresql/pg.conf:/etc/pg.conf \
    -v /data/config/postgresql/pg_hba.conf:/etc/pg_hba.conf \
    -v /data/config/postgresql/pg_ident.conf:/etc/pg_ident.conf \
    -v /data/mysql:/data/mysql \
    -v /data/gitea:/data/gitea \
    -v /run/pi:/run/pi \
    -v /data/config/gitea/app.ini:/etc/gitea/app.ini \
    -p 8080:8080 \
    -p 8022:8022 \
    --name pi \
    pi
