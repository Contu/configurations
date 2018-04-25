#!/bin/bash

filter() {
    tr '\n' ' ' | grep -Po '.*(?= \[playing])|paused'|tr -d '\n'
}

case $BLOCK_BUTTON in
    3) xdotool key super+n; mpc status | filter ;;
    1) mpc toggle | filter ;;
    *) mpc status | filter ;;
esac

