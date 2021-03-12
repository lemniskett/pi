#!/usr/bin/env bash

exec docker run \
    -v /data/webroot:/data/webroot \
    -v pi:/tmp \
    -p 8080:8080 \
    --name nginx-pi \
    nginx-pi