#!/usr/bin/env bash
source scripts/init.conf
sudo rm -rf /data/pi
sudo mkdir -p /data/pi
sudo chown -R root:$USERID /data/pi
sudo cp scripts/init.conf /data/pi/init.conf
sudo chmod -R 770 /data/pi

exec docker run \
    -v /data/webroot:/data/webroot \
    -v /data/postgres:/data/postgres \
    -v /data/mysql:/data/mysql \
    -v /data/gitea:/data/gitea \
    -v /data/pi:/data/pi \
    -p 8080:8080 \
    -p 8022:8022 \
    --name pi \
    --memory ${MEMORY}m \
    pi &