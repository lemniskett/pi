FROM --platform=linux/arm/hf alpine:3.13
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl
RUN apk update
RUN apk --no-cache add libintl && \
	apk --no-cache --virtual .locale_build add cmake make musl-dev gcc gettext-dev git && \
	git clone --depth=1 https://gitlab.com/rilian-la-te/musl-locales.git/ && \
	cd musl-locales && \
    cmake -DLOCALE_PROFILE=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr . && \
    make && make install && \
	cd .. && rm -r musl-locales && \
	apk del .locale_build
RUN apk add --no-cache runuser
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
RUN addgroup -g 202 -S php-fpm8-pi && \
    addgroup -g 203 -S mysql-pi && \
    addgroup -g 204 -S postgresql-pi && \
    adduser -u 202 -s /sbin/nologin -S -D -H -G php-fpm8-pi php-fpm8-pi && \
    adduser -u 203 -s /sbin/nologin -S -D -H -G mysql-pi mysql-pi && \
    adduser -u 204 -s /sbin/nologin -S -D -H -G postgresql-pi postgresql-pi && \
    addgroup php-fpm8-pi postgresql-pi
COPY --chown=php-fpm8-pi ["php.ini", "/etc/php8/php.ini"]
COPY --chown=php-fpm8-pi ["php-fpm.conf", "/etc/php8/php-fpm.conf"]
COPY --chown=php-fpm8-pi ["php-fpm.d", "/etc/php8/php-fpm.d"]
CMD ["runuser", "-u", "php-fpm8-pi", "--", "php-fpm8", "--nodaemonize"]