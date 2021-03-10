FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache \
    runuser \
    busybox-extras \
    vim
RUN apk add --no-cache nginx
RUN apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-zip \
    php8-iconv \
    php8-curl \
    php8-pgsql \
    php8-xml \
    php8-session \
    php8-mbstring 
RUN apk add --no-cache postgresql
RUN apk add --no-cache mariadb 
RUN apk add --no-cache gitea 
RUN addgroup -g 201 -S nginx_pi && \
    addgroup -g 202 -S php_fpm_pi && \
    addgroup -g 203 -S mariadb_pi && \
    addgroup -g 204 -S postgresql_pi && \
    addgroup -g 205 -S gitea_pi && \
    adduser -u 201 -s /sbin/nologin -S -D -H -G nginx_pi nginx_pi && \
    adduser -u 202 -s /sbin/nologin -S -D -H -G php_fpm_pi php_fpm_pi && \
    adduser -u 203 -s /sbin/nologin -S -D -H -G mariadb_pi mariadb_pi && \
    adduser -u 204 -s /sbin/nologin -S -D -H -G postgresql_pi postgresql_pi && \
    adduser -u 205 -s /bin/ash -S -D -H -G gitea_pi -h /data/gitea gitea_pi && \
    addgroup nginx_pi php_fpm_pi
COPY --chown=nginx_pi ["conf/nginx/nginx.conf", "/etc/nginx/nginx.conf"]
COPY --chown=php_fpm_pi ["conf/php-fpm/php.ini", "/etc/php8/php.ini"]
COPY --chown=php_fpm_pi ["conf/php-fpm/php-fpm.d", "/etc/php8/php-fpm.d"]
COPY --chown=postgresql_pi ["conf/postgresql/pg*", "/etc/"]
COPY --chown=gitea_pi ["conf/gitea/app.ini", "/etc/gitea/app.ini"]
COPY ["scripts/init.sh", "/init"]
COPY ["scripts/check.sh", "/bin/check"]
EXPOSE 8080
CMD ["/init"]
