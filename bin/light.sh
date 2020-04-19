#!/bin/bash


print() {
    echo " $(sudo brightnessctl info|sed -e '2!d' -e 's/(\(.*\))/\1/'| awk '{print $4}')"    
}


case $BLOCK_BUTTON in
    4) sudo brightnessctl set +5% > /dev/null; print ;; 
    5) sudo brightnessctl set 5%- > /dev/null; print ;; 
    *) print ;;
esac

#echo "Keybaord: `cat /sys/class/leds/smc\:\:kbd_backlight/brightness`"
