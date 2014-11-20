test -z "$PS1" && return

export EDITOR=vim
export GREP_OPTIONS="--exclude-dir=\.svn"

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

if test -d ~/debian/sid-root
then
	alias c="sudo chroot ~/debian/sid-root/root/webconverger/chroot env -i GIT_AUTHOR_NAME='Kai Hendry' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
	alias b="sudo chroot ~/debian/sid-root env -i PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
	alias i="cd ~/debian/sid-root/root/webconverger"
fi

# http://unix.stackexchange.com/a/18443/27433
shopt -s histappend
HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
export HISTFILESIZE=-1 HISTSIZE=-1
HISTFILE=~/bash_history/$(date +%Y-%m)

up() {
	cd ~/debian/sid-root/root/webconverger/chroot
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

if test -d "$HOME/bin"
then
	PATH="$HOME/bin:$PATH"
fi

# The next line updates PATH for the Google Cloud SDK.
source '/home/hendry/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/home/hendry/google-cloud-sdk/completion.bash.inc'

export CLOUDSDK_PYTHON=python2
