#!/bin/sh

/usr/sbin/sshd

runuser -u gitea_pi -- gitea web \
    --config /etc/gitea/app.ini \
    --work-path /data/gitea \
    --custom-path /data/gitea/custom