#!/usr/bin/env bash
redshiftpid=$(pgrep redshift)
if [[ "$redshiftpid" == $(echo "")  ]]
then
    gammastep -l 18.33:-67.23 &
fi
picom --config ~/.config/awesome/picom.conf &
emacs --daemon &
fcitx5 -d &
/./usr/bin/lxqt-policykit-agent &
pkill waybar
#~/.config/hypr/set_bar_theme.bash
waytrogen -s 1000 --restore &
waybar &
