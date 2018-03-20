#!/bin/bash

echo "Screen: $(light | cut -d. -f1)"
echo "Keybaord: `cat /sys/class/leds/smc\:\:kbd_backlight/brightness`"
