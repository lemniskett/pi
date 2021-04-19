#!/usr/bin/env bash

bar(){
    [[ -z $1 ]] && return 1
    bar="["
    for i in {1..36}; do
        [[ $1 -ge $i ]] \
            && bar+='#' \
            || bar+='-'
    done
    bar+=']'
    echo $bar
}

svstatus(){
    sudo ~/svstatus.sh $1 >/dev/null 2>&1
}

export TGSEND_TOKEN="$(cat /var/pi/.bot_token)"
export TGSEND_CHATID="699717356"
source /etc/os-release
os_name="$PRETTY_NAME"
arch="$(uname -m)"
host="$(cat /sys/firmware/devicetree/base/model 2>/dev/null)"
public_ip="$(curl ifconfig.co 2>/dev/null | sed 's/\./\\\./g')"
sshd_connected="$(ps auxwww | grep sshd: | grep @pts | wc -l)"
sshd_running="$(systemctl is-active sshd >/dev/null 2>&1 && echo active \($sshd_connected connected\) || echo stopped)"
ddclient_running="$(systemctl is-active ddclient >/dev/null 2>&1 && echo active || echo stopped)"
docker_deployed="$(docker ps -q | wc -l)"
docker_running="$(systemctl is-active docker >/dev/null 2>&1 && echo active \($docker_deployed running\) || echo stopped)"
uptime="$(uptime -p)"
clock="$(date '+%a %b %d %r')"
ram="$(free --mega | awk 'FNR==2{print $3}')"
maxram="$(free --mega | awk 'FNR==2{print $2}')"
disk="$(df -B 1000000 2>/dev/null | awk 'FNR==4{print $3}')"
maxdisk="$(df -B 1000000 2>/dev/null | awk 'FNR==4{print $2}')"
kernel="$(uname -r)"
temp="$(/opt/vc/bin/vcgencmd measure_temp)"
temp="${temp:5}"
temp="$(echo $temp | sed 's/\./\\\./g')"
ram_bar="$(bar $(($ram * 40 / $maxram)))"
disk_bar="$(bar $(($disk * 40 / $maxdisk)))"

$HOME/.local/bin/tgsend "*Server status \(lemniskett\\.ddns\\.net\)*
\`OS         : $os_name $arch
Host       : $host
Kernel     : $kernel
SysTime    : $clock
Uptime     : $uptime
Temp       : $temp
Public IP  : $public_ip

Disk       : ${disk}MB / ${maxdisk}MB
$disk_bar
Memory     : ${ram}MB / ${maxram}MB
$ram_bar\`

*Services*
\`Sshd       : $sshd_running
Ddclient   : $ddclient_running
Docker     : $docker_running
\`"
