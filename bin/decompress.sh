#!/bin/bash

EXT=${1##*.}
NAME=${1%%.*}

case $EXT in
    zip)
	unzip $1 -d $NAME
	;;
    gz)
	mkdir $NAME
	tar xzvf $1 -C $NAME
	;;
    bz2)
	mkdir $NAME
	tar xjvf $1 -C $NAME
	;;
    xz)
	mkdir $NAME
	tar xJvf $1 -C $NAME
	;;
    *)
	notify-send Unknown archive
	;;
esac

