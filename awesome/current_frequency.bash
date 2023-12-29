#!/usr/bin/env bash

CURR=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)

if [ $CURR -ge 1000000 ]; then
    CURR='scale=2;'"$CURR"/1000000'' | bc -l
    echo "$CURR GHz"
else
    echo $(($CURR/1000)) MHz
fi

