#!/bin/bash


print() {
    echo "$(light | cut -d. -f1)"    
}


case $BLOCK_BUTTON in
    4) light -A 5; print ;; 
    5) light -U 5; print ;; 
    *) print ;;
esac

#echo "Keybaord: `cat /sys/class/leds/smc\:\:kbd_backlight/brightness`"
