#!/bin/bash

if [[ ! -d $GHOST_FOLDER ]]; then
   mkdir $GHOST_FOLDER
elif [[ `ls -a $GHOST_FOLDER | wc -l` -gt 2 ]]; then
    echo "The folder already exists and it's NOT empty.";
    exit 1
fi

encfs ~/Dropbox/lupanar/ $GHOST_FOLDER

exit
