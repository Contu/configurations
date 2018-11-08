#!/bin/bash

NUM_PAR=`expr $# - 1`

FILES=()

for par in `seq 1 $NUM_PAR`; do
    FILES[`expr $par - 1`]="${!par}"
done


case ${!#} in
    zip)
	zip -r archive ${FILES[*]}
	;;
    gz)
	tar czvf archive.tar.gz ${FILES[*]}
	;;
    bz2)
	tar cjvf archive.tar.gz ${FILES[*]}
	;;
    xz)
	tar cJvf archive.tar.gz ${FILES[*]}
	;;
    *)
	notify-send Unknown archive
	;;
esac
