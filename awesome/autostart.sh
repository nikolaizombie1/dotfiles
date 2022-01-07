#!/bin/bash
redshiftpid=$(pgrep redshift-gtk)
echo "$redshiftpid"
if [[ "$redshiftpid" == $(echo "")  ]]
then
    redshift-gtk &
fi
nitrogen --restore &
picom --config ~/.config/i3/picom.conf &
/usr/bin/emacs --daemon &
