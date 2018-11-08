#!/bin/bash

case $BLOCK_BUTTON in
    1) urxvt -name cal -e calcurse; ;;
esac

echo `date '+%a %d/%m %H:%M'`

