export EDITOR=vim
export VISUAL=vim
export CVSEDITOR=vim
export EMAIL="hendry@iki.fi"
export DEBEMAIL="hendry@iki.fi"
export DEBFULLNAME='Kai Hendry'

export GREP_OPTIONS="--exclude-dir=\.svn"

shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
shopt -s cdspell
shopt -s cdable_vars

# disable terminal flow control
stty -ixon

complete -cf sudo

PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '

HISTSIZE=20000
PROMPT_COMMAND="history -a"
export HISTCONTROL=ignoredups
export HISTSIZE PROMPT_COMMAND

umask 002

hash most && export PAGER=most
hash most && alias more='most' && alias less='most'

alias ll='ls -alh --group-directories-first --color=always'
alias ac='vim ~/private/personal/accounts'
alias suspend='sudo pm-suspend'
alias scan="sudo iwlist wlan0 scan"
alias rejoin="sudo wpa_action wlan0 reload"
alias recordandroid="recordmydesktop -x 30 -y 47 --width 320 --height 480 --no-sound -o foo.ogv"
alias feh="sxiv"

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
