#!/bin/ash

source /data/pi/init.conf

run_nginx(){
    while true; do
        while `cat /run/pi/nginx.fifo`; do
            mkdir -p /run/nginx
            chown -R nginx_pi:nginx_pi \
                /etc/nginx/nginx.conf \
                /var/lib/nginx \
                /var/log/nginx \
                /usr/lib/nginx/modules \
                /run/nginx
            nginx
        done
    done
}

run_php_fpm(){
    while true; do
        while `cat /run/pi/php-fpm.fifo`; do
            mkdir -p /var/log/php8 /run/php-fpm
            chown -R php-fpm_pi:php-fpm_pi \
                /var/log/php8 \
                /etc/php8/php.ini \
                /etc/php8/php-fpm.d \
                /run/php-fpm
            runuser -u php-fpm_pi -- php-fpm8 --nodaemonize
        done
    done
}

run_mariadb(){
    while true; do
        while `cat /run/pi/mariadb.fifo`; do
            mkdir -p /run/mysqld
            chown -R mariadb_pi:mariadb_pi \
                /run/mysqld
            runuser -u mariadb_pi -- mysqld \
            -h /data/mysql 
        done
    done
}

run_postgresql(){
    while true; do
        while `cat /run/pi/postgresql.fifo`; do
            mkdir -p /run/postgresql
            chown -R postgresql_pi:postgresql_pi \
                /run/postgresql
            runuser -u postgresql_pi -- postgres \
                -i \
                --config-file=/etc/pg.conf
        done
    done
}

run_gitea(){
    while true; do
        while `cat /run/pi/gitea.fifo`; do
            mkdir -p /run/gitea
            chown -R gitea_pi:gitea_pi \
                /run/gitea
            runuser -u gitea_pi -- gitea web \
                --config /etc/gitea/app.ini \
                --work-path /data/gitea \
                --custom-path /data/gitea/custom
        done
    done
}

mkdir -p /data/log/init /run/pi
mkfifo \
    /run/pi/nginx.fifo \
    /run/pi/php-fpm.fifo \
    /run/pi/mariadb.fifo \
    /run/pi/postgresql.fifo \
    /run/pi/gitea.fifo 
chown root:$USERID /run/pi/* /data/pi/init.conf
chmod 660 /run/pi/* /data/pi/init.conf
run_nginx > /data/log/init/nginx.log 2>&1 &
run_php_fpm > /data/log/init/php-fpm.log 2>&1 &
run_mariadb > /data/log/init/mariadb.log 2>&1 &
run_postgresql > /data/log/init/postgresql.log 2>&1 &
run_gitea > /data/log/init/gitea.log 2>&1 &
echo $nginx > /run/pi/nginx.fifo
echo $php_fpm > /run/pi/php-fpm.fifo
echo $mariadb > /run/pi/mariadb.fifo
echo $postgresql > /run/pi/postgresql.fifo
echo $gitea > /run/pi/gitea.fifo
tail -f /data/log/init/*.log
