#!/usr/bin/env bash

exec docker run \
    -v /data/webroot:/data/webroot \
    -v /data/config/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v /data/config/nginx/servers:/etc/nginx/servers \
    -p 8080:8080 \
    --network pi \
    --ip 10.0.0.2 \
    --name nginx \
    l-nginx &
