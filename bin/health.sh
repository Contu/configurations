#!/bin/bash

TEMP=$(sensors | awk '/^Package/ {print $4}')

FAN=$(sensors| awk '/^fan/ {print $2}')

if [[ $FAN -gt 0 ]]; then
    echo "$TEMP - $FAN RPM"
else
    echo "$TEMP"
fi

case $BLOCK_BUTTON in
    1) notify-send ' ' "<span font='20px'>Biggest CPU hogs:</span><br><br><span font='12px'>$(ps axch -o cmd:20,%cpu --sort=-%cpu | head)</span>" ;;
    3) notify-send ' ' "<span font='20px'>Biggest memory hogs:</span><br><br><span font='12px'>$(ps axch -o cmd:20,%mem --sort=-%mem | head)</span>" ;;
esac
