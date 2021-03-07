#!/usr/bin/env bash

exec docker run \
    -v /data/gitea:/data/gitea \
    -v /data/config/gitea/app.ini:/etc/gitea/app.ini \
    -p 8022:8022 \
    --network pi \
    --ip 10.0.0.6 \
    --name gitea \
    l-gitea &