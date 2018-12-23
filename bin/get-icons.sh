#!/bin/bash

cat .icons.txt | dmenu -i -l 20 | awk '{print $1}' | xclip -selection clipboard

notify-send "$(xclip -o -selection clipboard) copied to clipboard"
