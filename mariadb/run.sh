#!/usr/bin/env bash

exec docker run \
    -v /data/mysql:/data/mysql \
    --network pi \
    --ip 10.0.0.4 \
    --name mariadb \
    l-mariadb &