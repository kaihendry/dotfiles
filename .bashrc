# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If running interactively, then:
if [ "$PS1" ]; then

    export CVSROOT=hendry@melkinpaasi.cs.helsinki.fi:/home/fs/hendry/cvs

    export EDITOR=vim
    export VISUAL=vim
    export CVSEDITOR=vim

    # don't put duplicate lines in the history. See bash(1) for more options
    export HISTCONTROL=ignoredups

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # enable color support of ls and also add handy aliases
    if [ "$TERM" != "dumb" ]; then
	eval `dircolors -b`
	alias ls='ls --color=auto'
	#alias dir='ls --color=auto --format=vertical'
	#alias vdir='ls --color=auto --format=long'
    fi

    # some more ls aliases
    alias ll='ls -al'
    #alias la='ls -A'
    #alias l='ls -CF'

    # set a (really) fancy prompt

    COLOR1="\[\033[0;36m\]"
    COLOR2="\[\033[0;32m\]"
    COLOR3="\[\033[0;36m\]"
    COLOR4="\[\033[1;37m\]"

    if [ "$UID" = "0" ];
    then
    # I am root
    COLOR2="\[\033[1;31m\]"
    fi

    PS1="$COLOR2($COLOR3\u@\h$COLOR2:$COLOR1\W$COLOR2)$COLOR1\\$ $COLOR4"

    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        ;;
    *)
        ;;
    esac

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc).
    if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
fi
