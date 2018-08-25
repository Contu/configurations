# Environment variables
export VISUAL="emacsclient -a vim -nw"
export EDITOR="emacsclient -a vim -nw"
export SUDO_EDITOR="emacsclient -a vim -nw"
export ALTERNATE_EDITOR="vim"
export PATH=$PATH:~/bin
export BROWSER=firefox
export TERMINAL=urxvt
export PS1="\[\033[01;36m\]\W:\[\033[00m\] "
export SECURE_FOLDER=~/secure

[[ -d $SECURE_FOLDER && `ls -a $SECURE_FOLDER | wc -l` -eq 2 ]] && rmdir $SECURE_FOLDER 

#disable bell
xset -b

# Alias
alias gitLog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %C(red bold)%an%C(reset)' --all"
alias ll='ls -hlF'

# Functions
em() {
    if [ -f "$1" ] && [ ! -w "$1" ]; then
    	sudo -e $1
    else
    	emacsclient -a vim -nw $1
    fi
}

fn() {
     if [ $# -eq 1 ]; then
         find . -name $1 2> /dev/null
     else
	 echo "Wrong arguments !!!"
     fi
}

gr() {
    if [ $# -eq 1 ]; then
	grep -ilrF $1 2> /dev/null
    elif [ $# -eq 2 ]; then
	grep -ilrF $1 --include="$2" 2> /dev/null
    else
	echo "Wrong arguments !!!"
    fi
}
