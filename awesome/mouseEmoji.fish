#!/bin/fish

echo -ne \U1F5B1 ;upower --dump | awk -f ~/.config/awesome/mouseEmoji.awk
