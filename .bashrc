test -z "$PS1" && return

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export EDITOR=vim
export VISUAL=vim
export EMAIL="hendry@webconverger.com"
export DEBEMAIL="hendry@webconverger.com"
export DEBFULLNAME='Kai Hendry'

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
alias ac='vim ~/private/personal/accounts'
alias suspend='sudo systemctl suspend'

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias e='vim'
alias c="sudo chroot ~/debian/sid-root/root/webconverger/chroot"
alias b="sudo chroot ~/debian/sid-root"
alias i="cd ~/debian/sid-root/root/webconverger"

PROMPT_COMMAND="history -a; history -n"

up() {
cd ~/debian/sid-root/root/webconverger/chroot
git push
}

6music(){
mplayer http://www.bbc.co.uk/radio/listen/live/r6_aaclca.pls
}

r4(){
cvlc http://bbc.co.uk/radio/listen/live/r4.asx
}

halt(){
sudo poweroff
}

export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_COMMITTER_NAME="Kai Hendry"
export GIT_COMMITTER_EMAIL=hendry@webconverger.com
export GIT_AUTHOR_EMAIL=hendry@webconverger.com
