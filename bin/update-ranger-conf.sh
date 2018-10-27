#!/bin/bash

cp -f ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.bak

LINE_START_CUSTOM_MAPPING=$(grep -n "Custom mapping" ~/.config/ranger/rc.conf | cut -d':' -f1)

if [[ $LINE_START_CUSTOM_MAPPING = '' ]]; then
    cp ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.temp
else
    head -n $(expr $LINE_START_CUSTOM_MAPPING - 1) ~/.config/ranger/rc.conf > ~/.config/ranger/rc.conf.temp
fi

cat ~/.ranger-conf.txt >> ~/.config/ranger/rc.conf.temp

mv ~/.config/ranger/rc.conf.temp ~/.config/ranger/rc.conf

rm -f ~/.config/ranger/rc.conf.temp 
