FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache \
    runuser \
    nginx \
    busybox-extras \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-zip \
    php8-iconv \
    php8-curl \
    php8-pgsql \
    php8-xml \
    php8-session \
    php8-mbstring \
    postgresql \
    mariadb \
    gitea \
    openssh \
    openssh-server-pam 
RUN addgroup -g 5000 -S nginx_pi && \
    addgroup -g 5001 -S php-fpm_pi && \
    addgroup -g 5002 -S mariadb_pi && \
    addgroup -g 5003 -S postgresql_pi && \
    addgroup -g 5004 -S gitea_pi && \
    adduser -u 5000 -s /sbin/nologin -S -D -H -G nginx_pi nginx_pi && \
    adduser -u 5001 -s /sbin/nologin -S -D -H -G php-fpm_pi php-fpm_pi && \
    adduser -u 5002 -s /sbin/nologin -S -D -H -G mariadb_pi mariadb_pi && \
    adduser -u 5003 -s /sbin/nologin -S -D -H -G postgresql_pi postgresql_pi && \
    adduser -u 5004 -s /bin/ash -S -D -H -G gitea_pi -h /data/gitea gitea_pi && \
    addgroup nginx_pi php-fpm_pi
RUN ssh-keygen -A && \
    echo 'UsePAM yes' >> /etc/ssh/sshd_config && \
    echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config && \
    echo 'Port 8022' >> /etc/ssh/sshd_config
EXPOSE 8080 8022
COPY init.sh /init.sh
CMD /init.sh
