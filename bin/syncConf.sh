#!/bin/bash

CODE=~/code/configurations

rsync -av ~/.config/i3 $CODE
rsync -av ~/.emacs $CODE/.emacs
rsync -av ~/.vimrc $CODE/.vimrc
rsync -av ~/.Xdefaults $CODE/.Xdefaults
rsync -av ~/bin $CODE
rsync -av ~/.bashConf.sh $CODE/.bashConf.sh
