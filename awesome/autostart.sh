#!/bin/bash
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
redshiftpid=$(pgrep redshift)
if [[ "$redshiftpid" == $(echo "")  ]]
then
    redshift &
fi
nitrogen --restore &
picom --config ~/.config/awesome/picom.conf --experimental-backends &
emacs --daemon &
fcitx -d &
nm-applet &
/./usr/bin/lxqt-policykit-agent &
sleep 5s && nmap 10.0.0.0/24 && sshfs weeb@$(ip neigh | awk '/44:8a:5b:ce:75:8a/ {print $1}'):/home/weeb/Mass-Storage ~/Debian\ Server/ -p 39801 -C -o IdentityFile=~/.ssh/id_ed25519_personal &
