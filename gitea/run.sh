#!/usr/bin/env bash

exec docker run \
    -v /data/gitea:/data/gitea \
    -v pi:/tmp \
    --name gitea-pi \
    gitea-pi