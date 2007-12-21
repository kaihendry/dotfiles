# Thanks to Ari Pollak

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
setopt NO_BEEP
setopt   notify correct pushdtohome cdablevars autolist
setopt   correctall autocd longlistjobs
setopt   autoresume histignoredups noclobber
setopt   autopushd extendedglob rcquotes mailwarning
setopt	 correctall sharehistory interactivecomments
setopt	 printeightbit
unsetopt automenu # don't start completing when I press TAB too many times
unsetopt autoparamslash bgnice cdablevars

bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

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
if [ `uname` = "Linux" ]; then
	alias ls='ls -F --color=auto'
else
	alias ls='ls -F'
fi
alias ll='ls -alh'
alias todo='vim /home/hendry/projects/webconverger/webconverger.org/TODO'
alias h='cat ~/.bash_history.archive | grep -i'
[ -x /usr/bin/dircolors ] && eval `dircolors`
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

autoload -U colors
colors

PROMPT="%{${fg[green]}%}%m%{${fg[white]}%}:%{${fg[cyan]}%}%~%{${fg[white]}%}%#%{${fg[default]}%} "
#RPROMPT='%W %t'     # prompt for right side of screen

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

doc() { cd /usr/share/doc/$1 && ls }
_doc() { _files -W /usr/share/doc -/ }
compdef _doc doc

export PATH=/usr/lib/ccache:$PATH
#export http_proxy=http://localhost:3128/
