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

complete -cf sudo

PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '

HISTSIZE=20000
PROMPT_COMMAND="history -a"
export HISTCONTROL=ignoredups
export HISTSIZE PROMPT_COMMAND

umask 002

hash most &>/dev/null && export PAGER=most
hash most &>/dev/null && alias more='most' && alias less='most'

alias ll='ls -alh --group-directories-first --color=always'
alias ac='vim ~/private/personal/accounts'
alias suspend='sudo pm-suspend'
alias feh="sxiv"

alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
