#!/bin/sh

chmod 770 -R /data/webroot
chmod 700 -R /data/{postgres,mysql,gitea}
chown 82:82 -R /data/webroot
chown 999:999 -R /data/postgres
chown 100:100 -R /data/mysql
chown 973:973 -R /data/gitea
