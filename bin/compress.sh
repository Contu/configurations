#!/bin/bash

NUM_PAR=`expr $# - 1`

for par in `seq 1 $NUM_PAR`; do
    #echo $par
    FILE="${FILE} ${!par}"
done

case ${!#} in
    zip)
	zip -r archive $FILE
	;;
    gz)
	tar czvf archive.tar.gz $FILE
	;;
    bz2)
	tar cjvf archive.tar.gz $FILE
	;;
    xz)
	tar cJvf archive.tar.gz $FILE
	;;
    *)
	notify-send Unknown archive
	;;
esac

