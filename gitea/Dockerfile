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
RUN apk add gitea
RUN addgroup -g 205 -S gitea-pi && \
    adduser -u 205 -s /sbin/nologin -S -D -H -G gitea-pi -h /data/gitea gitea-pi
COPY --chown=gitea-pi ["app.ini", "/etc/gitea/app.ini"]
CMD ["runuser", "-u", "gitea-pi", "--", "gitea", "web", "--config", "/etc/gitea/app.ini", "--work-path", "/data/gitea", "--custom-path", "/data/gitea/custom"]