# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If running interactively, then:
if [ "$PS1" ]; then

    export CVSROOT=hendry@melkinpaasi.cs.helsinki.fi:/home/fs/hendry/cvs

    # For subversion on CS computers
    if [ -d /home/hendry/svn/bin/ ]; then
        export PATH=$PATH:/home/hendry/svn/bin/
    fi

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
    alias mutto='mutt -F ~/.muttorc'
    export todo=~/personal/todo.txt

    # user@host pwd should be provided my WM title bar IMO
    PS1='$ '

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

    umask 002

fi

export EMAIL=hendry@cs.helsinki.fi
export CVSROOT=/home/group/nodes/cvs

#export LANG=en_GB.UTF-8
#export LC_ALL=en_GB.UTF-8

export LANG=en_GB
export LC_ALL=en_GB



export PATH=$PATH:/home/hendry/projects/scripts
export PYTHONPATH=/home/hendry/projects/nevow/trunk
