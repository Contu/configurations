#!/bin/bash

FSTYPE=`lsblk -no FSTYPE $1`
if [ $FSTYPE == 'vfat' ]; then
    LABEL=`sudo dosfslabel $1`
elif [[ $FSTYPE =~ '^ext.*' ]]; then
    LABEL=`sudo e2label $1`
elif [ $FSTYPE == 'iso9660' ]; then
    LABEL='ISO9660'
else
    echo "$FSTYPE: Unknown file system"
    exit 1
fi
# default label if it does NOT exist
if [[ ! -v LABEL ]]; then
    LABEL='NO_LABEL'
fi
#trim LABEL
read  -rd '' LABEL <<< "$LABEL"
LABEL=${LABEL// /__}
mkdir ~/$LABEL
sudo mount -o uid=`id -u`,gid=`id -g` $1 ~/$LABEL

