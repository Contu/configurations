#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "tell me the folder to decrypt"
    exit 1
else
    if [[ ! -d $SECURE_FOLDER ]]; then
	mkdir $SECURE_FOLDER
    elif [[ `ls -a $SECURE_FOLDER | wc -l` -gt 2 ]]; then
	echo "The folder already exists and it's NOT empty.";
	exit 1
    fi

    encfs $1 $SECURE_FOLDER
fi

exit
