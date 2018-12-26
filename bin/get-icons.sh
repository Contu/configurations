#!/bin/bash

ICON=$(cat .icons.txt | dmenu -i -l 20)

if [[ $ICON = '' ]]; then
    exit 1
fi

echo "$ICON" | awk '{print $1}' | xclip -selection clipboard

notify-send "$(xclip -o -selection clipboard) copied to clipboard"
