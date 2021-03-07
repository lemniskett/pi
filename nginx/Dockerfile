FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache nginx busybox-extras \
    && mkdir /run/nginx
RUN addgroup -g 5000 -S nginx_pi
RUN adduser -u 5000 -s /sbin/nologin -S -D -H -G nginx_pi nginx_pi
EXPOSE 8080
CMD nginx -g 'daemon off;'