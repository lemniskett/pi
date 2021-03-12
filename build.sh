#!/usr/bin/env bash

chmod -R 770 /data/webroot
chmod -R 700 /data/mysql
chmod -R 700 /data/postgres
chmod -R 700 /data/gitea
docker volume create pi >/dev/null && echo "Creating volume \"pi\""
docker build -t nginx-pi nginx/
docker build -t php-fpm8-pi php-fpm8/
docker build -t mysql-pi mysql/
docker build -t postgresql-pi postgresql/
docker build -t gitea-pi gitea/