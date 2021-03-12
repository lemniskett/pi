#!/usr/bin/env bash

exec docker run \
    -v /data/postgres:/data/postgres \
    -v pi:/tmp \
    --name postgresql-pi \
    postgresql-pi