#!/bin/bash

PLACE=""
if [[ $# -eq 1 ]]; then
    SEPARATOR="/"
    PLACE=$SEPARATOR$1
elif [[ $# -gt 1 ]]; then
    echo "Put in the location or nothing"
fi

curl "wttr.in$PLACE?2&lang=it"
