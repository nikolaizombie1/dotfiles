#!/usr/bin/env bash

 readarray -t AWK_OUTPUT < <(awk -F '=' '/wallpaper/ {print $2}' < ~/.config/hypr/hyprpaper.conf)


WALLPAPER=$(echo "${AWK_OUTPUT[0]}" | cut -d ',' -f 2 | cut -c 3-)
JSON=$(color_scheme_generator "$HOME/$WALLPAPER")
BAR_COLOR_JSON=$(echo "$JSON" | jq '.[1].bar_color')
BAR_RED=$(echo "$BAR_COLOR_JSON" | jq '.red')
BAR_GREEN=$(echo "$BAR_COLOR_JSON" | jq '.green')
BAR_BLUE=$(echo "$BAR_COLOR_JSON" | jq '.blue')
COMMAND="s/@define-color bar_color rgba (.*)/@define-color bar_color rgba ($BAR_RED,$BAR_GREEN,$BAR_BLUE,0.8)/"
sed -i "$COMMAND" "$HOME/.config/waybar/style.css"
WORKSPACE_COLOR_JSON=$(echo "$JSON" | jq '.[1].text_color')
WORKSPACE_RED=$(echo "$WORKSPACE_COLOR_JSON" | jq '.red')
WORKSPACE_GREEN=$(echo "$WORKSPACE_COLOR_JSON" | jq '.green')
WORKSPACE_BLUE=$(echo "$WORKSPACE_COLOR_JSON" | jq '.blue')
COMMAND="s/@define-color text_color rgba (.*)/@define-color text_color rgba ($WORKSPACE_RED,$WORKSPACE_GREEN,$WORKSPACE_BLUE,1.0)/" 
sed -i "$COMMAND" "$HOME/.config/waybar/style.css"
