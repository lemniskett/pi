FROM --platform=linux/arm/hf alpine:3.13
RUN apk update
RUN apk add --no-cache nginx
RUN addgroup -g 201 -S nginx-pi && \
    addgroup -g 202 -S php-fpm8-pi && \
    addgroup -g 205 -S gitea-pi && \
    adduser -u 201 -s /sbin/nologin -S -D -H -G nginx-pi nginx-pi && \
    adduser -u 202 -s /sbin/nologin -S -D -H -G php-fpm8-pi php-fpm8-pi && \
    adduser -u 205 -s /sbin/nologin -S -D -H -G gitea-pi -h /data/gitea gitea-pi && \
    addgroup nginx-pi php-fpm8-pi && \
    addgroup nginx-pi gitea-pi
COPY --chown=nginx-pi ["nginx.conf", "/etc/nginx/nginx.conf"]
EXPOSE 8080
CMD ["nginx"]