#!/bin/bash

import -window root /tmp/lock.png
convert -size 400x100 xc:transparent -pointsize 90 -fill white -stroke red -strokewidth 3 -annotate +35+75 'LOCKED' /tmp/annotate.gif

convert /tmp/lock.png -paint 1 -swirl 45 \
	/tmp/annotate.gif -gravity center \
	-composite /tmp/lock.png

mpc pause

i3lock -e -f -c 000000  -i /tmp/lock.png
