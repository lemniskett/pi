# Pi

Containers for my Pi server.

## Setup

```sh
sudo loginctl enable-linger $UID
systemctl enable --now --user podman.socket
echo "$USER ALL=(ALL) NOPASSWD: /var/pi/bot/sysupd.sh,/var/pi/bot/sysboot.sh" | sudo tee -a /etc/sudoers
echo "<bot token>" > /var/pi/.bot_token
sudo systemctl daemon-reload
sudo systemctl enable --now pi telegram-bot
```
