#!/usr/bin/env bash

PERCENT=$(cat /sys/class/power_supply/CMB0/capacity)
STATUS=$(cat /sys/class/power_supply/CMB0/status)

if [ "$STATUS" == "Discharging" ]; then
    EMOJI='\U1F50B'
else
    EMOJI='\U1F50C'
fi

printf "$PERCENT"'%%'"$EMOJI"
