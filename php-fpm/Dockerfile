FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache php8 \
    php8-fpm \
    php8-mysqli \
    php8-zip \
    php8-iconv \
    php8-curl \
    php8-pgsql \
    php8-xml \
    php8-session \
    php8-mbstring
RUN addgroup -g 5001 -S php-fpm_pi
RUN adduser -u 5001 -s /sbin/nologin -S -D -H -G php-fpm_pi php-fpm_pi
EXPOSE 9000
CMD php-fpm8 --nodaemonize