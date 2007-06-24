# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
setopt SHARE_HISTORY NO_BEEP AUTO_CD
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hendry/.zshrc'

autoload -Uz compinit
compinit

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
while true
do
  startx
done
fi

export EDITOR=vim
export VISUAL=vim
export CVSEDITOR=vim
export EMAIL=hendry@iki.fi
export DEBEMAIL=hendry@iki.fi
export DEBFULLNAME='Kai Hendry'

alias ll='ls -alh'
alias ls='ls --color=auto'
alias todo='vim /home/hendry/projects/webconverger/webconverger.org/TODO'
