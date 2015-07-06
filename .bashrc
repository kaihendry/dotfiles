test -z "$PS1" && return

export EDITOR=vim

shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
shopt -s cdable_vars

complete -cf sudo

PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '

umask 002

alias ll='ls -alh --group-directories-first --color=always'
alias ac='vim ~/private/accounts'
alias suspend='sudo systemctl suspend'
alias s='sudo systemctl'
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

if test -d ~/debian/jessie-chroot
then
	alias c="sudo chroot ~/debian/jessie-chroot/root/Debian-Live-config/webconverger/chroot env -i GIT_AUTHOR_NAME='Kai Hendry' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
	alias b="sudo chroot ~/debian/jessie-chroot env -i HOME=/root/ PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
	alias i="cd /home/hendry/debian/jessie-chroot/root/Debian-Live-config/webconverger"
fi

# http://unix.stackexchange.com/a/18443/27433
shopt -s histappend
HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
export HISTFILESIZE=-1 HISTSIZE=-1
HISTFILE=~/bash_history/$(date +%Y-%m)

up() {
	cd ~/debian/jessie-chroot/root/Debian-Live-config/webconverger/chroot
	git push
}

h() {
	grep $@ ~/bash_history/*
}

p() {
	curl -n -F 'f:1=<-' http://ix.io
}

bitrate () {
	iw wlan0 link | grep bitrate
}

export EMAIL="hendry@webconverger.com"
export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_COMMITTER_NAME="Kai Hendry"
export GIT_COMMITTER_EMAIL=hendry@webconverger.com
export GIT_AUTHOR_EMAIL=hendry@webconverger.com
export NODE_PATH=/usr/lib/node_modules/
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


if test -d "/usr/local/bin"
then
	PATH="/usr/local/bin:$PATH"
fi



if test -d "$HOME/bin"
then
	PATH="$HOME/bin:$PATH"
fi

if test -d /home/hendry/google-cloud-sdk
then

# The next line updates PATH for the Google Cloud SDK.
source '/home/hendry/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/home/hendry/google-cloud-sdk/completion.bash.inc'

export CLOUDSDK_PYTHON=python2
fi
