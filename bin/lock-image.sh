#!/bin/bash

import -window root /tmp/lock.png

convert /tmp/lock.png -paint 1 -swirl 45 ~/Pictures/lock_small.png -gravity center -composite /tmp/lock.png

mpc pause

i3lock -e -f -c 000000  -i /tmp/lock.png
