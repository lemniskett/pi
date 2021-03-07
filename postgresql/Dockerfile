FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache postgresql runuser
RUN addgroup -g 5003 -S postgresql_pi
RUN adduser -u 5003 -s /sbin/nologin -S -D -H -G postgresql_pi postgresql_pi
EXPOSE 5432
CMD runuser -u postgresql_pi -- postgres -i --config-file=/etc/pg.conf