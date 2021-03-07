#!/usr/bin/env bash

exec docker run \
    -v /data/postgres:/data/postgres \
    -v /data/config/postgresql/pg.conf:/etc/pg.conf \
    -v /data/config/postgresql/pg_hba.conf:/etc/pg_hba.conf \
    -v /data/config/postgresql/pg_ident.conf:/etc/pg_ident.conf \
    --network pi \
    --ip 10.0.0.5 \
    --name postgresql \
    l-postgresql &