FROM docker.io/library/php:8.0-fpm-alpine
RUN apk add --no-cache runuser postgresql-dev libzip-dev zlib-dev libpng-dev
RUN docker-php-ext-install mysqli pgsql zip gd intl
RUN sed -i 's#listen = 127.0.0.1:9000#listen = 9000#g' /usr/local/etc/php-fpm.d/www.conf
COPY composer.sh /composer.sh
RUN sh /composer.sh
WORKDIR /data/webroot
CMD ["php-fpm"]
