#!/bin/bash

TEMP=$(sensors|grep Package|awk '{print $4}')

FAN=$(sensors|grep fan| awk '{print $2}')

if [[ $FAN -gt 0 ]]; then
    echo "$TEMP - $FAN RPM"
else
    echo "$TEMP"
fi
