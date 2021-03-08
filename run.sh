#!/usr/bin/env bash

exec docker run \
    -v /data/webroot:/data/webroot \
    -v /data/postgres:/data/postgres \
    -v /data/mysql:/data/mysql \
    -v /data/gitea:/data/gitea \
    -v /data/pi:/data/pi \
    -v /run/pi:/run/pi \
    -p 8080:8080 \
    -p 8022:8022 \
    --name pi \
    pi