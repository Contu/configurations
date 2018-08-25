#!/bin/bash


print() {
    if [[ `amixer -D pulse get Capture | tail -1 ` =~ \[on\] ]]; then
	echo  `amixer -D pulse get Capture|tail -1|grep -o "[0-9]*%"`
    else
	echo 
    fi
}


case $BLOCK_BUTTON in
    1) amixer -q -D pulse sset Capture toggle; print ;; #exec pkill -RTMIN+10 ;;
    4) amixer -q -D pulse sset Capture 5%+; print ;; #exec pkill -RTMIN+10 ;;
    5) amixer -q -D pulse sset Capture 5%-; print ;; #exec pkill -RTMIN+10 ;;
    *) print ;;
esac

