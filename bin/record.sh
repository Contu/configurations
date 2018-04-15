#!/bin/bash

pkill -f x11grab || ffmpeg  -y -f x11grab -s 1280x800 -i :0.0 ~/Videos/screen-`date +%d:%m:%g_%H:%M:%S`.mkv
