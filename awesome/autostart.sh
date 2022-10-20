#!/bin/bash
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
redshiftpid=$(pgrep redshift)
if [[ "$redshiftpid" == $(echo "")  ]]
then
    redshift &
fi
nitrogen --restore &
picom --config ~/.config/awesome/picom.conf --experimental-backends &
/usr/bin/emacs --daemon &
fcitx -d &
/usr/bin/numlockx on
sshfs -p 39801 weeb@weeb:/home/weeb/Mass-Storage/ Debian\ Server -sshfs -p 39801 weeb@weeb:/home/weeb/Mass-Storage/ Debian\ Server -C -o IdentityFile=~/.ssh/id_ed25519_personal &
