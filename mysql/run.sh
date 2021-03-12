#!/usr/bin/env bash

exec docker run \
    -v /data/mysql:/data/mysql \
    -v pi:/tmp \
    --name mysql-pi \
    mysql-pi