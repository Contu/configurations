#!/bin/bash

replaceSpace="-##-"

#cd "$1"

#read test
#echo "path: $test"

#for fileName in `ls | awk '/.mp3$/ {print substr($0, 0, length($0)-4)}' | sed "s/ /$replaceSpace/g"`; do
#for album in `ls -d */ | sed "s/ /$replaceSpace/g"`; do
    #realDir=`echo $album | sed "s/$replaceSpace/ /g"`
    #for fileName in `ls "$realDir" | sed "s/ /$replaceSpace/g"`; do
    for fileName in `ls | sed "s/ /$replaceSpace/g"`; do
        file=`echo $fileName | awk '{print substr($0, 0, length($0)-4)}'`
        ext=`echo $fileName | awk '{print substr($0, length($0)-3)}'`
        realName=`echo $file | sed "s/$replaceSpace/ /g"`
        if [ $ext == '.mp3' ]; then
            sox -S "$realDir$realName$ext" "$realDir$realName.ogg" #2> ~/convertMp3ToOgg.log
        elif [ $ext == '.m4a' ]; then
            ffmpeg -i "$realDir$realName$ext" -c:a libvorbis "$realDir$realName.ogg" #2> ~/converM4aToOgg.log
        fi
    done
#done
