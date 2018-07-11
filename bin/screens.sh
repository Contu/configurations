#!/bin/bash

EXTERNAL_SCREEN=""
EMBEDDED_SCREEN=LVDS1

for screen in `xrandr | grep " connected " | awk '{ print$1 }'`; do
    if [[ $screen != "$EMBEDDED_SCREEN" ]]; then
	EXTERNAL_SCREEN=$screen
    fi
done

if [[ $EXTERNAL_SCREEN != "" ]]; then
    connected=`xrandr | grep -E "VGA1 connected [1-9]+x[1-9]+\+[0-9]\+[0-9]" | sed "s/ /_/g"`
    #off external screens
    if [[ $connected != "" ]]; then
	xrandr --output $EXTERNAL_SCREEN --off
    elif [[ $1 == "mirror" ]]; then
	xrandr --output $EXTERNAL_SCREEN --left-of $EMBEDDED_SCREEN --auto --same-as $EMBEDDED_SCREEN
    else
	xrandr --output $EXTERNAL_SCREEN --left-of $EMBEDDED_SCREEN --auto
    fi
fi

    
