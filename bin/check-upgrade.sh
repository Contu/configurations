#!/bin/bash

case $BLOCK_BUTTON in
    1) urxvt -e sudo pacman -Syu && pacman -Qu | wc -l > ~/.pacupgrade && pkill -RTMIN+8 i3blocks; exit ;;
esac

# delay 1 minute to be sure the internet connection is available
sleep 1m

sudo pacman -Sy > /dev/null
pacman -Qu | wc -l > ~/.pacupgrade && pkill -RTMIN+8 i3blocks


if [[ `cat ~/.pacupgrade` -ne 0 ]]; then
    echo `cat ~/.pacupgrade`
fi
