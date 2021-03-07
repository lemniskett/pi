#!/bin/sh

runuser -u postgresql_pi -- postgres \
    -i \
    --config-file=/etc/pg.conf