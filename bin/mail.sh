#!/bin/bash

print() {
    personal=`ls ~/mail/Gmail/INBOX/new | wc -l`
    work=`ls ~/mail/Gmail/Work/new | wc -l`

    echo $(($personal + $work))    
}

case $BLOCK_BUTTON in
    1) urxvt -name mutt -e neomutt; print ;;
    *) print ;;
esac

	

