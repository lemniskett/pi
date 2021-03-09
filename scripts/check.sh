#!/bin/ash

nginx=$(pidof nginx >/dev/null 2>&1 && echo running || echo stopped)
php_fpm=$(pidof php-fpm8 >/dev/null 2>&1 && echo running || echo stopped)
mariadb=$(pidof mysqld >/dev/null 2>&1 && echo running || echo stopped)
postgresql=$(pidof postgres >/dev/null 2>&1 && echo running || echo stopped)
gitea=$(pidof gitea >/dev/null 2>&1 && echo running || echo stopped)
date="$(date '+%a %b %d %r')"

cat << EOF > /data/pi/pi.log
# System
date="$date"

# Services
nginx="$nginx"
php_fpm="$php_fpm"
mariadb="$mariadb"
postgresql="$postgresql"
gitea="$gitea"
EOF