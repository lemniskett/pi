FROM --platform=linux/arm/hf alpine:3.13
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV MUSL_LOCPATH="/usr/share/i18n/locales/musl"
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
RUN apk add --no-cache mysql
RUN addgroup -g 202 -S php-fpm8-pi && \
    addgroup -g 203 -S mysql-pi && \
    adduser -u 202 -s /sbin/nologin -S -D -H -G php-fpm8-pi php-fpm8-pi && \
    adduser -u 203 -s /sbin/nologin -S -D -H -G mysql-pi mysql-pi && \
    addgroup php-fpm8-pi mysql-pi
CMD ["runuser", "-u", "mysql-pi", "--", "mysqld", "-h", "/data/mysql", "--socket", "/tmp/mysql.sock"]