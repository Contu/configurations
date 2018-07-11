#!/bin/bash

case $BLOCK_BUTTON in
    1) $TERMINAL -e sudo pacman -Syu && pacman -Qu | wc -l > ~/.pacupgrade && pkill -RTMIN+8 i3blocks ;;
esac

pacman -Qu | wc -l > ~/.pacupgrade && pkill -RTMIN+8 i3blocks


if [[ `cat ~/.pacupgrade` -ne 0 ]]; then
    echo `cat ~/.pacupgrade`
fi
