FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache mariadb
RUN addgroup -g 5002 -S mariadb_pi
RUN adduser -u 5002 -s /sbin/nologin -S -D -H -G mariadb_pi mariadb_pi
EXPOSE 3306
CMD mysqld -u mariadb_pi -h /data/mysql --disable-skip-networking --bind-address 0.0.0.0 --disable-unix-socket --socket ''