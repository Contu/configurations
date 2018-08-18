#!/bin/bash

print() {
    personal=`ls ~/mail/Gmail/INBOX/new | wc -l`
    work=`ls ~/mail/Gmail/Work/new | wc -l`

    mail=$(($personal + $work))

    if [[ $mail -gt 0 ]]; then
	echo " $mail"
    fi
    
}

case $BLOCK_BUTTON in
    1) urxvt -name mutt -e neomutt; print ;;
    *) print ;;
esac

	

