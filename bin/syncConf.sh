#!/bin/bash

CODE=~/code/configurations

rsync -av ~/.config/feh $CODE
rsync -av ~/.urxvt $CODE
rsync -av ~/.ncmpcpp $CODE
rsync -av ~/.config/i3 $CODE
rsync -av ~/.newsboat/config $CODE/newsboat
rsync -av ~/.newsboat/urls $CODE/newsboat
rsync -av ~/.emacs $CODE/.emacs
rsync -av ~/.vimrc $CODE/.vimrc
rsync -av ~/.mailcap $CODE/.mailcap
rsync -av ~/.i3blocks.conf $CODE/.i3blocks.conf
rsync -av ~/.Xdefaults $CODE/.Xdefaults
rsync -av ~/bin $CODE
rsync -av ~/.bashConf.sh $CODE/.bashConf.sh
rsync -av ~/.ranger-conf.txt $CODE/.ranger-conf.txt
