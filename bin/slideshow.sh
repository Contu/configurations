#!/bin/bash

IMAGES_FOLDER=~/Pictures/wallpapers
SOUNDTRACK=~/bin/Peligro.ogg

cat $IMAGES_FOLDER/* | ffmpeg -y -framerate 0.10 -f image2pipe -i - \
    -i $SOUNDTRACK -acodec copy \
    ~/Videos/slideshow.webm
