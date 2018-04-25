#!/bin/bash

echo "$(light | cut -d. -f1)"
#echo "Keybaord: `cat /sys/class/leds/smc\:\:kbd_backlight/brightness`"
