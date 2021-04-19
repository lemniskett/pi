FROM docker.io/library/nginx:1.19-alpine
RUN addgroup nginx www-data
COPY ["credentials", "/credentials"]
# Generate self-signed SSL
RUN apk add openssl && \
    openssl req -x509 -nodes -days 90 -newkey rsa:4096 \
    -keyout /etc/nginx/me.key -out /etc/nginx/me.crt < /credentials && \
    chown nginx:nginx /etc/nginx/me.*
STOPSIGNAL SIGQUIT
WORKDIR /etc/nginx
EXPOSE 8080 8180 8280 8380 8480
CMD ["nginx", "-g", "daemon off;"]
