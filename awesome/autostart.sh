#!/bin/bash
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
sshfs -p 39801 weeb@10.0.0.75:/home/weeb/Mass-Storage/ Debian\ Server -C
