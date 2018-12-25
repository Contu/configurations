#!/bin/bash

if [[ -f ~/.record-pid ]]; then
    pkill -f x11grab
    rm -f ~/.record-pid
    echo '' > ~/.recording-icon
else
    ffmpeg  -y -f x11grab \
	       -s `xdpyinfo |grep dimensions|awk '{print $2}'` \
	       -i :0.0 \
	       -f alsa -i default \
	       ~/Videos/screen-`date +%d:%m:%g_%H:%M:%S`.mkv &> /dev/null &
    echo "$!" > ~/.record-pid
    echo "echo " > ~/.recording-icon
fi

pkill -RTMIN+6 i3blocks
