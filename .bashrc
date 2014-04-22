test -z "$PS1" && return

if test -d "$HOME/bin"
then
	PATH="$HOME/bin:$PATH"
fi

if test -d "$HOME/go_appengine"
then
	PATH="$HOME/go_appengine:$PATH"
fi

if test -d "/home/hendry/.gem/ruby/2.1.0/bin"
then
	PATH="/home/hendry/.gem/ruby/2.1.0/bin:$PATH"
fi

export EDITOR=vim
export GREP_OPTIONS="--exclude-dir=\.svn"

shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
shopt -s cdspell
shopt -s cdable_vars

complete -cf sudo

PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '

unset HISTFILESIZE
export HISTSIZE=50000
export HISTCONTROL="ignoreboth"

umask 002

alias ll='ls -alh --group-directories-first --color=always'
alias ac='vim ~/private/accounts'
alias suspend='sudo systemctl suspend'

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

if test -d ~/debian/sid-root
then
	alias c="sudo chroot ~/debian/sid-root/root/webconverger/chroot env -i GIT_AUTHOR_NAME='Kai Hendry' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
	alias b="sudo chroot ~/debian/sid-root env -i PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
	alias i="cd ~/debian/sid-root/root/webconverger"
fi

PROMPT_COMMAND="history -a; history -n"

up() {
	cd ~/debian/sid-root/root/webconverger/chroot
	git push
}

r4(){
	cvlc http://bbc.co.uk/radio/listen/live/r4.asx
}

p() {
	curl -n -F 'f:1=<-' http://ix.io
}

export EMAIL="hendry@webconverger.com"
export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_COMMITTER_NAME="Kai Hendry"
export GIT_COMMITTER_EMAIL=hendry@webconverger.com
export GIT_AUTHOR_EMAIL=hendry@webconverger.com
export NODE_PATH=/usr/lib/node_modules/
export GOPATH=~/go

s() {
	systemctl status $1
}
