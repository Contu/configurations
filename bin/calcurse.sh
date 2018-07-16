#!/bin/bash

case $BLOCK_BUTTON in
    1) urxvt -name cal -e calcurse; ;;
esac

if [[ `calcurse -a | wc -l` -ne 0 ]]; then
    echo 
fi
