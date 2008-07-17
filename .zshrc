# Thanks to Ari Pollak

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
setopt NO_BEEP
setopt   notify correct pushdtohome cdablevars autolist
setopt   correctall autocd longlistjobs
setopt   autoresume histignoredups 
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

#if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
#while true
#do
#  startx
#done
#fi

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

EXTRABINS=($HOME/projects/scripts /usr/lib/ccache $HOME/android/android_sdk_linux_m3-rc37a/tools /home/hendry/projects/static)

EPATH=""
for i in ${EXTRABINS[@]}
do
if [ -e $i ];then
    EPATH=$i:$EPATH
fi
done
export PATH=$PATH:$EPATH


[ -x /usr/bin/most ] && export PAGER=most
[ -x /usr/bin/most ] && alias more='most' && alias less='most'
#sudo update-alternatives --config pager

alias tests='cd /home/hendry/aplix/code/trunk/tests/html'
alias mods='cd /home/hendry/aplix/code/trunk/modules'
alias webvm='cd /home/hendry/aplix/code/trunk/webvm'
alias wiki='cd /home/hendry/aplix/wiki'
alias rtest="ssh -X nox /home/hendry/runtest/runtest.sh -u"
alias itest='/home/hendry/aplix/runtest/runtest.sh'
alias rec='screen -d -r'
alias ac='vim private/personal/accounts'

alias diff=colordiff
alias radio2='mplayer "rtsp://rmlive.bbc.co.uk/bbc-rbs/rmlive/ev7/live24/radio2/live/r2_dsat_g2.ra?BBC-UID=9427ad23ac8f6e909061ec7641002c1c5e71eb5fb010a166c395c50c48b52efa&SSO2-UID="'
alias radio1='mplayer "mms://wmlive-acl.bbc.co.uk/wms/radio1/radio1_nb_e1s1?BBC-UID=f4279e47c9a971baebd3dfea9040fba93d3d46eb50d03184e4ef3a0f75413cbc_n&amp;SSO2-UID="'
alias radio4='mplayer "rtsp://rmlive.bbc.co.uk/bbc-rbs/rmlive/ev7/live24/radio4/live/r4_dsat_g2.ra?BBC-UID=3428f11c94d584ec7096897410205233fb0c690500400124647f991f15c8414e_n&SSO2-UID="'
alias radio5='mplayer "rtsp://rmlive-acl.bbc.co.uk/bbc-rbs/rmlive-acl/ev7/live24/radio5/live/r5_tl_g2.ra?BBC-UID=f4e8d3b4d73380462cbdde543030325dcc7dd7f0a0d081f444bff63fc234ac8b_n&SSO2-UID="'

alias suspend='sudo s2ram -f -a 3'

alias muttl='mutt -e "set folder=$HOME/Mail" -e "set record=+dabase/INBOX.Sent.`date +%Y-%m`" -e "set spoolfile=+dabase/INBOX" -e "source ~/Mail/muttrc.mailboxes"'
alias checkmail='tail -f /var/log/exim4/mainlog'
xbacklight -set 100 # max brightness please
dict() { /usr/bin/dict "$@" | ${PAGER:-most}; }

# disable terminal flow control
stty -ixoff

#[ $TERM = "screen" ] && echo ${SSH_AGENT_PID}
#if [ $TERM = "screen" ] && [ -z "${SSH_AGENT_PID}" ] && [ -z "${SSH_AUTH_SOCK}" ]; then
#	eval `ssh-agent`
#	logger "Setting up ssh-agent"
#	ssh-add ~/.ssh/id_rsa
#	ssh-add -l
#fi

md5 () { md5sum $1 > $1.MD5SUM }
alias scpresume="rsync --partial --progress --rsh=ssh"
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export WEBVMHOME=/home/hendry/aplix/code/trunk/webvm

exec 2>>(while read line; do
  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)

