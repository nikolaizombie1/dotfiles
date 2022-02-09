#!/bin/bash
redshiftpid=$(pgrep redshift-gtk)
echo "$redshiftpid"
if [[ "$redshiftpid" == $(echo "")  ]]
then
    redshift-gtk &
fi
nitrogen --restore &
picom --config ~/.config/awesome/picom.conf --experimental-backends &
/usr/bin/emacs --daemon &
fcitx -d &
