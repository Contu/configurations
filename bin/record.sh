#!/bin/bash

pkill -f x11grab || ffmpeg  -y -f x11grab \
-s `xdpyinfo |grep dimensions|awk '{print $2}'` \
-i :0.0 ~/Videos/screen-`date +%d:%m:%g_%H:%M:%S`.mkv &> /dev/null &
