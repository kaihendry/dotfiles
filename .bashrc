test -z "$PS1" && return
test -d ~/bash_history/ || mkdir ~/bash_history/
test -d ~/clip_history/ || mkdir ~/clip_history/

shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
shopt -s cdable_vars

complete -cf sudo

umask 002

alias vim=nvim
alias ls=exa
alias ll='exa -alh --group-directories-first --color=always'
alias ac="/usr/bin/vim ~/private/accounts"

# http://unix.stackexchange.com/a/18443/27433
shopt -s histappend
HISTCONTROL=ignoredups
PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/\~}\007"'
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
export HISTFILESIZE=-1 HISTSIZE=-1
HISTFILE=~/bash_history/$(date +%Y-%m)

h() {
	rg --sort path -a $@ ~/bash_history/*
}

export GIT_AUTHOR_NAME="Kai Hendry"
export GIT_COMMITTER_NAME="Kai Hendry"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if test -d "/usr/local/bin"; then
	PATH="/usr/local/bin:$PATH"
fi

if test -d "$HOME/.local/bin"; then
	PATH="$HOME/.local/bin:$PATH"
fi

if test -d "$HOME/bin"; then
	PATH="$HOME/bin:$PATH"
fi

if test -d "/home/linuxbrew/.linuxbrew/bin/"; then
	PATH="$PATH:/home/linuxbrew/.linuxbrew/bin/"
fi

test -f /usr/bin/aws_completer && complete -C '/usr/bin/aws_completer' aws

export PATH="/usr/local/sbin:$PATH"

# test -f /etc/profile.d/autojump.bash && source /etc/profile.d/autojump.bash

eval "$(zoxide init --cmd j  bash)"

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
alias today='date -u +%Y-%m-%d'

millitime() {
	if test "$1"; then
		# time described by arg
		echo $(($(date -d"$1" +%s%N) / 1000000))
	else
		# now
		echo $(($(date +%s%N) / 1000000))
	fi
}

gdiff() {
	git diff main... --name-status
}

ifconfig() {
	ip -br -c a
}

alias g='docker run -it --rm -v $(pwd):/src hendry/goide:latest $@'
alias te='f(){ docker run -it --entrypoint=sh --rm -v $(pwd):/src quay.io/nvim-lsp/try.nvim:nightly-typescript; unset -f f; }; f'

alias i="cd ~/.config/nvim/"
alias sloc="scc --no-cocomo -c"

eval "$(direnv hook bash)"
eval "$(starship init bash)"

export SAM_CLI_TELEMETRY=0

source /usr/share/nvm/init-nvm.sh

alias sts='aws sts get-caller-identity'
alias ga='git commit -a'

