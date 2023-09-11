#!/bin/bash
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
redshiftpid=$(pgrep redshift)
if [[ "$redshiftpid" == $(echo "")  ]]
then
    redshift -t 6500:3000 &
fi
nitrogen --restore
picom --config ~/.config/awesome/picom.conf &
emacs --daemon &
fcitx -d &
/./usr/bin/lxqt-policykit-agent &
