FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache gitea
RUN addgroup -g 5004 -S gitea_pi
RUN adduser -u 5004 -s /bin/ash -S -D -H -G gitea_pi gitea_pi
EXPOSE 3000 8022
CMD gitea web --config /etc/gitea/app.ini --work-path /data/gitea --custom-path /data/gitea/custom