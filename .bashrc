test -z "$PS1" && return

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

# Trying to get a history that works... (might be BS)
HISTSIZE=20000
PROMPT_COMMAND="history -a"
export HISTCONTROL=ignoredups
export HISTSIZE PROMPT_COMMAND

umask 002

alias ll='ls -alh --group-directories-first --color=always'
alias ac='vim ~/private/personal/accounts'
alias suspend='sudo pm-suspend'
alias feh="sxiv"

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias e='vim'
alias c="sudo chroot ~/debian/sid-root/root/webconverger/chroot"
alias b="sudo chroot ~/debian/sid-root"
alias i="cd ~/debian/sid-root/root/webconverger"

hb() {
ssh hetty "cd ~/Debian-Live-config/webconverger; sudo make -f ~/Debian-Live-config/webconverger/Makefile deploy"
}

up() {
cd ~/debian/sid-root/root/webconverger/chroot
git push
}

6music(){
mplayer http://www.bbc.co.uk/radio/listen/live/r6_aaclca.pls
}

upneon() {
cd ~/debian/sid-root/root/webconverger/chroot
git push neon neon
}

export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_COMMITTER_NAME="Kai Hendry"
export GIT_COMMITTER_EMAIL=hendry@webconverger.com
export GIT_AUTHOR_EMAIL=hendry@webconverger.com
