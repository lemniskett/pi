# Pi

Containers for my Pi server.

## Setup

```sh
sudo ln -s $PWD /var/pi
sudo cp $PWD/system/pi.service /etc/systemd/system/pi.service
sudo cp $PWD/system/telegram-bot.service /etc/systemd/system/telegram-bot.service
echo "$USER ALL=(ALL) NOPASSWD: /var/pi/bot/sysupd.sh,/var/pi/bot/sysboot.sh" | sudo tee -a /etc/sudoers
echo "<bot token>" > /var/pi/.bot_token
sudo systemctl daemon-reload
sudo ./fixperm.sh
sudo systemctl enable --now pi telegram-bot
```

## Daemon :
```json
{
    "storage-driver": "btrfs",
    "data-root": "/containers",
    "insecure-registries": ["192.168.254.3:5000"]
}
```
