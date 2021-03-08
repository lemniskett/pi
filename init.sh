#/bin/ash

USER_ID="1000"

run_sshd(){
    while true; do
    /usr/sbin/sshd
    done
}

run_nginx(){
    while true; do
        mkdir -p /run/nginx
        chown -R nginx_pi:nginx_pi \
            /etc/nginx/nginx.conf \
            /var/lib/nginx \
            /var/log/nginx \
            /usr/lib/nginx/modules \
            /run/nginx
        nginx
    done
}

run_phpfpm(){
    while true; do
    mkdir -p /var/log/php8 /run/php-fpm
    chown -R php-fpm_pi:php-fpm_pi \
        /var/log/php8 \
        /etc/php8/php.ini \
        /etc/php8/php-fpm.d \
        /run/php-fpm
        runuser -u php-fpm_pi -- php-fpm8 --nodaemonize
    done
}

run_mariadb(){
    while true; do
    mkdir -p /run/mysqld
    chown -R mariadb_pi:mariadb_pi \
        /run/mysqld
        runuser -u mariadb_pi -- mysqld \
        -h /data/mysql 
    done
}

run_postgresql(){
    while true; do
    mkdir -p /run/postgresql
    chown -R postgresql_pi:postgresql_pi \
        /run/postgresql
        runuser -u postgresql_pi -- postgres \
            -i \
            --config-file=/etc/pg.conf
    done
}

run_gitea(){
    while true; do
    mkdir -p /run/gitea
    chown -R gitea_pi:gitea_pi \
        /run/gitea
        runuser -u gitea_pi -- gitea web \
            --config /etc/gitea/app.ini \
            --work-path /data/gitea \
            --custom-path /data/gitea/custom
    done
}

mkdir -p /data/log/init
run_sshd > /data/log/init/sshd.log 2>&1 & 
run_nginx > /data/log/init/sshd.log 2>&1 &
run_phpfpm > /data/log/init/phpfpm.log 2>&1 &
run_mariadb > /data/log/init/mariadb.log 2>&1 &
run_postgresql > /data/log/init/postgresql.log 2>&1 &
run_gitea > /data/log/init/gitea.log 2>&1 &

mkdir -p /run/init
mkfifo /run/pi/init.fifo
chmod 770 /run/pi/init.fifo
chown 0:$USER_ID /run/pi/init.fifo
while true; do ash /run/pi/init.fifo > /run/pi/out; done
