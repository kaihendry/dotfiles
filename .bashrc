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

alias ll='ls -alh --group-directories-first --color=always'
alias ac="/usr/bin/vim ~/private/accounts"
alias suspend='sudo systemctl suspend'
alias s='sudo systemctl'
alias grep='GREP_COLOR="1;33;40" LANG=C grep --exclude-dir=node_modules --color=auto'

if test -d /home/hendry/webc/webc
then
	alias c="sudo chroot /home/hendry/webc/webc env -i GIT_AUTHOR_NAME='Kai Hendry' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
fi

# http://unix.stackexchange.com/a/18443/27433
shopt -s histappend
HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
export HISTFILESIZE=-1 HISTSIZE=-1
HISTFILE=~/bash_history/$(date +%Y-%m)

webcup() {
	cd ~/debian/jessie-chroot/root/Debian-Live-config/webconverger/chroot
	git push
}

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

export WEBC_CHECKOUT=/home/hendry/webc/webc

webcup() {
	cd $WEBC_CHECKOUT
	git push
}

test -f /usr/bin/ruby && PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

test -f /usr/bin/aws_completer && complete -C '/usr/bin/aws_completer' aws

# added by travis gem
[ -f /home/hendry/.travis/travis.sh ] && source /home/hendry/.travis/travis.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/hendry/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/hendry/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/hendry/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/hendry/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
