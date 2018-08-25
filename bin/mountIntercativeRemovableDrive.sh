#!/bin/bash

function create-mount-point {
    LABEL=$1
    # default label if it does NOT exist
    if [[ -z "$LABEL" ]]; then
	LABEL='NO_LABEL'
    fi
    #trim LABEL
    read  -rd '' LABEL <<< "$LABEL"
    LABEL=${LABEL// /__}
    
    mkdir ~/$LABEL
    echo "$LABEL"
}

DEVICE=$(lsblk -ln -o NAME | awk '!/sda/ {print $0}' | dmenu -i -p MOUNT)

FSTYPE=`lsblk -no FSTYPE /dev/$DEVICE`

if [[ $FSTYPE == 'vfat' ]]; then
    LABEL=`sudo dosfslabel $1`
    LABEL=`create-mount-point $LABEL`
    sudo mount -o uid=`id -u`,gid=`id -g` /dev/$DEVICE ~/$LABEL
    notify-send "Mounted successfully"
elif [[ $FSTYPE == 'ext4' ]]; then
    LABEL=`sudo e2label /dev/$DEVICE`
    create-mount-point $LABEL
    sudo mount /dev/$DEVICE ~/$LABEL
    sudo chown -R `id -u`:`id -g` ~/$LABEL
    notify-send "Mounted successfully"
elif [[ $FSTYPE == 'iso9660' ]]; then
    LABEL=`lsblk -ln -o NAME,LABEL | awk -v DEVICE="$DEVICE" '($1==DEVICE) {print $2}'`
    create-mount-point $LABEL
    sudo mount --read-only /dev/$DEVICE ~/$LABEL
    notify-send "Mounted successfully"
else
    notify-send -u critical "$FSTYPE: Unknown file system"
    exit 1
fi

