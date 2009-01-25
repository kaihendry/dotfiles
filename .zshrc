# Thanks to Ari Pollak

APLIX_ROOT=/mnt/truecrypt1/aplix

if ! test -d $APLIX_ROOT
then
	echo $APLIX_ROOT mount not unlocked
fi

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

alias tests="cd $APLIX_ROOT/code/trunk/tests/html"
alias mods="cd $APLIX_ROOT/code/trunk/modules"
alias webvm="cd $APLIX_ROOT/code/trunk/webvm"
alias wiki="cd $APLIX_ROOT/wiki"
alias itest="$APLIX_ROOT/runtest/runtest.sh"
alias rec='screen -d -r'
alias ac='vim private/personal/accounts'

alias diff=colordiff
alias radio2='mplayer "rtsp://rmlive.bbc.co.uk/bbc-rbs/rmlive/ev7/live24/radio2/live/r2_dsat_g2.ra?BBC-UID=9427ad23ac8f6e909061ec7641002c1c5e71eb5fb010a166c395c50c48b52efa&SSO2-UID="'
alias radio1='mplayer "mms://wmlive-acl.bbc.co.uk/wms/radio1/radio1_nb_e1s1?BBC-UID=f4279e47c9a971baebd3dfea9040fba93d3d46eb50d03184e4ef3a0f75413cbc_n&amp;SSO2-UID="'
alias radio4='mplayer "rtsp://rmlive.bbc.co.uk/bbc-rbs/rmlive/ev7/live24/radio4/live/r4_dsat_g2.ra?BBC-UID=3428f11c94d584ec7096897410205233fb0c690500400124647f991f15c8414e_n&SSO2-UID="'

alias suspend='sudo s2ram -f -a 3 && slock'
alias scpresume="rsync --partial --progress --rsh=ssh"

alias checkmail='tail -f /var/log/exim4/mainlog'
xbacklight -set 100 # max brightness please
dict() { /usr/bin/dict "$@" | ${PAGER:-most}; }

# disable terminal flow control
stty -ixoff

md5 () { md5sum $1 > $1.MD5SUM }
synct() { rsync -zartpv --progress --delete $APLIX_ROOT/tsystem/csv kai@tsystem.iasolution.net:tsystem }
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export WEBVMHOME=$APLIX_ROOT/code/trunk/webvm
export J2MEWTK=$APLIX_ROOT/WTK2.5.2
