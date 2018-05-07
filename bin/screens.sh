#!/bin/bash

EXTERNAL_SCREEN=""

for screen in `xrandr | grep " connected " | awk '{ print$1 }'`; do
    if [ $screen !=  'LVDS1' ]; then
	EXTERNAL_SCREEN=$screen
    fi
done

if [ $EXTERNAL_SCREEN != "" ]; then
    connected=`xrandr | grep -E "VGA1 connected [1-9]+x[1-9]+\+[0-9]\+[0-9]" | sed "s/ /_/g"`
    #off external screens
    if [ $connected != "" ]; then
	xrandr --output $EXTERNAL_SCREEN --off
    else
	xrandr --output $EXTERNAL_SCREEN --left-of LVDS1 --auto
    fi
fi

    
