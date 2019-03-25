test -z "$PS1" && return
test -d ~/bash_history/ || mkdir ~/bash_history/

export EDITOR=nvim
alias vim=nvim

shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
shopt -s cdable_vars

complete -cf sudo
if test "$HOSTNAME" == "teefour"
then
	GREEN="\[$(tput setaf 2)\]"
	RESET="\[$(tput sgr0)\]"
	PS1="${GREEN}\[\e[1m\]\w\$\[\e[0m\] ${RESET}"
fi

umask 002

alias nt='st -e bash -c "cd $PWD; exec bash" &'
alias ll='ls -alh --group-directories-first --color=always'
alias ac="/usr/bin/vim ~/private/accounts"
alias suspend='sudo systemctl suspend'
alias s='sudo systemctl'
alias grep='GREP_COLOR="1;33;40" LANG=C grep --exclude-dir=node_modules --color=auto'

export WEBC_CHECKOUT=/home/hendry/webc/webc
if test -d $WEBC_CHECKOUT
then
	c() {
		#sudo mount -t proc proc $WEBC_CHECKOUT/proc/
		#sudo mount -t sysfs sys $WEBC_CHECKOUT/sys/
		#sudo mount -o bind /dev $WEBC_CHECKOUT/dev/
		sudo chroot /home/hendry/webc/webc env -i GIT_AUTHOR_NAME='Kai Hendry' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash
		#sudo umount $WEBC_CHECKOUT/proc/
		#sudo umount $WEBC_CHECKOUT/sys/
		#sudo umount $WEBC_CHECKOUT/dev/
	}
fi

# http://unix.stackexchange.com/a/18443/27433
shopt -s histappend
HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
export HISTFILESIZE=-1 HISTSIZE=-1
HISTFILE=~/bash_history/$(date +%Y-%m)

h() {
	grep -a $@ ~/bash_history/*
}

p() {
	curl -n -F 'f:1=<-' http://ix.io
}

bitrate () {
	iw wlan0 link | grep bitrate
}

vtime () {
	ffprobe -v quiet -print_format json -show_format "$1" | jq -r .format.tags.creation_time
}

export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_COMMITTER_NAME="Kai Hendry"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if test -d "/usr/local/bin"
then
	PATH="/usr/local/bin:$PATH"
fi


if test -d "/home/hendry/.local/bin"
then
	PATH="/home/hendry/.local/bin:$PATH"
fi

cors() {
curl -v -o /dev/null $1 2>&1 | grep Allow
}

if test -d "$HOME/.local/bin"
then
	PATH="$HOME/.local/bin:$PATH"
fi

if test -d "$HOME/bin"
then
	PATH="$HOME/bin:$PATH"
fi

if test -d /home/hendry/google-cloud-sdk
then

# The next line updates PATH for the Google Cloud SDK.
source '/home/hendry/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/home/hendry/google-cloud-sdk/completion.bash.inc'

export CLOUDSDK_PYTHON=python2
fi

test -f ~/.profile && source ~/.profile

test -d "$HOME/.node_modules/bin" && export PATH="$HOME/.node_modules/bin:$PATH"

alias g="cd /home/hendry/go/src/github.com/kaihendry"


webcup() {
	cd $WEBC_CHECKOUT
	git push
}

test -f /usr/bin/ruby && PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

test -f /usr/bin/aws_completer && complete -C '/usr/bin/aws_completer' aws

# added by travis gem
[ -f /home/hendry/.travis/travis.sh ] && source /home/hendry/.travis/travis.sh

export PATH="/usr/local/sbin:$PATH"

r() {
	cd /home/hendry/recordmydesktop2.0/$(date +%Y-%m-%d)
}
