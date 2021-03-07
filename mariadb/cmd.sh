#!/bin/sh

exec mysqld \
    -u mariadb_pi \
    -h /data/mysql \
    --disable-skip-networking \
    --bind-address 0.0.0.0 \
    --disable-unix-socket \
    --socket ''