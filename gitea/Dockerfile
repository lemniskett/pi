FROM --platform=arm64 alpine:3.13
RUN apk add --no-cache gitea openssh openssh-server-pam runuser
RUN addgroup -g 5004 -S gitea_pi
RUN adduser -u 5004 -s /bin/ash -S -D -H -G gitea_pi -h /data/gitea gitea_pi
RUN ssh-keygen -A && \
    echo 'UsePAM yes' >> /etc/ssh/sshd_config && \
    echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config && \
    echo 'Port 8022' >> /etc/ssh/sshd_config
EXPOSE 3000 8022
COPY cmd.sh /cmd.sh
CMD /cmd.sh