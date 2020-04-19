# Environment variables
export VISUAL="emacsclient -a vim -nw"
export EDITOR="emacsclient -a vim -nw"
export SUDO_EDITOR="emacsclient -a vim -nw"
export ALTERNATE_EDITOR="vim"
export PATH=$PATH:~/bin
export BROWSER=firefox
export TERMINAL=urxvt
#export PS1="\[\033[01;36m\]\W:\[\033[00m\] "
export SECURE_FOLDER=~/secure
#Colors FG
#export KC='\033[0;30m'
#export RC='\033[0;31m'
#export GC='\033[0;32m'
#export YC='\033[1;33m'
#export OC='\033[0;33m'
#export BC='\033[0;34m'
#export PC='\033[0;35m'
#export CC='\033[0;36m'
#export AC='\033[0;37m'
#export WC='\033[1;37m'
#export NC='\033[0m'

#man colors
#export LESS_TERMCAP_mb=$'\e[1;32m'
#export LESS_TERMCAP_md=$'\e[1;32m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;31m'


[[ -d $SECURE_FOLDER && `ls -a $SECURE_FOLDER | wc -l` -eq 2 ]] && rmdir $SECURE_FOLDER 

#disable bell
#xset -b

# Alias
#alias gitLog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %C(red bold)%an%C(reset)' --all"
ll='ls -hlF'
#alias ls='ls --color'
#alias ll='ls --color -l'
#alias grep='grep --color'

# Functions
#em() {
#    if [ -f "$1" ] && [ ! -w "$1" ]; then
#    	sudo -e $1
#    else
#    	emacsclient -a vim -nw $1
#    fi
#}

# fn() {
#      if [ $# -eq 1 ]; then
#          find . -name $1 2> /dev/null
#      else
# 	 echo "Wrong arguments !!!"
#      fi
# }

# gr() {
#     if [ $# -eq 1 ]; then
# 	grep -ilrF $1 2> /dev/null
#     elif [ $# -eq 2 ]; then
# 	grep -ilrF $1 --include="$2" 2> /dev/null
#     else
# 	echo "Wrong arguments !!!"
#     fi
# }

