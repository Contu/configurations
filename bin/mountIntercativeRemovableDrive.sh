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

DEVICE=$(lsblk -lo name,rm,label|awk '{if ($2 == 1) { print $1"["$3"]"}}' | dmenu -i -p MOUNT)

DEVICE=$(echo $DEVICE | cut -d'[' -f1)

if [[ $DEVICE = '' ]]; then
    exit 1
fi
   

FSTYPE=$(lsblk -lno fstype /dev/$DEVICE)
LABEL=$(lsblk -lno label /dev/$DEVICE)

if [[ $FSTYPE == 'vfat' ]]; then
    #LABEL=`sudo dosfslabel $1`
    LABEL=`create-mount-point $LABEL`
    sudo mount -o uid=`id -u`,gid=`id -g` /dev/$DEVICE ~/$LABEL
    notify-send "$LABEL mounted successfully"
elif [[ $FSTYPE =~ '^ext.*' ]]; then
    #LABEL=`sudo e2label /dev/$DEVICE`
    create-mount-point $LABEL
    sudo mount /dev/$DEVICE ~/$LABEL
    sudo chown -R `id -u`:`id -g` ~/$LABEL
    notify-send "$LABEL mounted successfully"
elif [[ $FSTYPE == 'iso9660' || $FSTYPE == 'udf' ]]; then
    #LABEL=`lsblk -ln -o NAME,LABEL | awk -v DEVICE="$DEVICE" '($1==DEVICE) {print $2}'`
    create-mount-point $LABEL
    sudo mount --read-only /dev/$DEVICE ~/$LABEL
    notify-send "$LABEL mounted successfully"
else
    notify-send -u critical "$FSTYPE: Unknown file system"
    exit 1
fi

