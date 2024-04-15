#!/usr/bin/env bash

region_copy () {
    scrot -fs -l style=dash,width=3,color="#000000",opacity=128,mode=edge ~/Pictures/"$NAME"
    xclip -sel clip -t image/png ~/Pictures/"$NAME"
}
active_window_copy () {
    scrot -u ~/Pictures/"$NAME"
    xclip -sel clip -t image/png ~/Pictures/"$NAME"
}

NAME=$(date '+%e-%b-%Y-%H-%M-%S').png
while getopts "rw" opt; do
    case "${opt}" in
        r) region_copy
           ;;
        w) active_window_copy
           ;;
        *) ;;
    esac
done
