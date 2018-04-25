#!/bin/bash

print() {
    if [[ `amixer -D pulse get Master | tail -1 ` =~ \[on\] ]]; then
	echo  `amixer -D pulse get Master | tail -1|grep -o "[0-9]*%"`
    else
	echo 
    fi
}


case $BLOCK_BUTTON in
    1) amixer -q -D pulse sset Master toggle; print ;; 
    4) amixer -q -D pulse sset Master 5%+; print ;; 
    5) amixer -q -D pulse sset Master 5%-; print ;; 
    *) print ;;
esac
