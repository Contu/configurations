#!/bin/bash

sleep 1

if [[ $(xset -q | grep 'Caps Lock' | awk '{print $4}') = 'on' ]]; then
    echo 'CAPS'
else
    echo ''
fi
