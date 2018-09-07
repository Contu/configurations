#!/bin/bash

extension=${1##*.}

case ${extension^^} in
    JPG|PNG|JPEG|TIFF)
	feh $1
	;;
    PDF)
	filename=${1##*/}
	curl -o /tmp/$filename $1
	mupdf /tmp/$filename
	;;
    WEBM|MKV|GIF|AVI|MP4)
	mpv $1
	;;
    *)
	$BROWSER $1
esac

exit 0
