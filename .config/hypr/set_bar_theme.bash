#!/usr/bin/env bash

set -x

readarray -t AWK_OUTPUT < <(waytrogen --list-current-wallpapers | jq -r 'map(select(.monitor != "All")) | .[] | "\(.monitor):\(.path)"')


for ENTRY in "${AWK_OUTPUT[@]}"; do
    echo "$ENTRY"
    MONITOR=$(echo "$ENTRY" | cut -d':' -f 1)
    echo "$MONITOR"
    WALLPAPER=$(echo "$ENTRY" | cut -d':' -f 2)
    echo "$WALLPAPER"
    JSON=$(color_scheme_generator "$WALLPAPER")
    echo "$JSON"
    BAR_COLOR_JSON=$(echo "$JSON" | jq '.[0]')
    BAR_RED=$(echo "$BAR_COLOR_JSON" | jq '.red')
    BAR_GREEN=$(echo "$BAR_COLOR_JSON" | jq '.green')
    BAR_BLUE=$(echo "$BAR_COLOR_JSON" | jq '.blue')
    COMMAND="s/@define-color bar_color_$MONITOR rgba (.*)/@define-color bar_color_$MONITOR rgba ($BAR_RED,$BAR_GREEN,$BAR_BLUE,0.8)/"
    sed -i "$COMMAND" "$HOME/.config/waybar/style.css"
    WORKSPACE_COLOR_JSON=$(echo "$JSON" | jq '.[1]')
    WORKSPACE_RED=$(echo "$WORKSPACE_COLOR_JSON" | jq '.red')
    WORKSPACE_GREEN=$(echo "$WORKSPACE_COLOR_JSON" | jq '.green')
    WORKSPACE_BLUE=$(echo "$WORKSPACE_COLOR_JSON" | jq '.blue')
    COMMAND="s/@define-color text_color_$MONITOR rgba (.*)/@define-color text_color_$MONITOR rgba ($WORKSPACE_RED,$WORKSPACE_GREEN,$WORKSPACE_BLUE,1.0)/" 
    sed -i "$COMMAND" "$HOME/.config/waybar/style.css"
done

