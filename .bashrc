# If running interactively, then:
if [ "$PS1" ]; then

    # For subversion
    if [ -d $HOME/opt/ ]; then
        echo Local stuff!
        export LD_LIBRARY_PATH="$HOME/opt/lib:$LD_LIBRARY_PATH"
        export PATH="$HOME/opt/bin/:$PATH"
    fi

    export EDITOR=vim
    export VISUAL=vim
    export CVSEDITOR=vim

    # don't put duplicate lines in the history. See bash(1) for more options
    export HISTCONTROL=ignoredups

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize
    shopt -s histappend

    # enable color support of ls and also add handy aliases
    if [ "$TERM" != "dumb" ]; then
	eval `dircolors -b`
	alias ls='ls --color=auto'
    fi

    # some more ls aliases
    alias ll='ls -al'
    alias mutto='mutt -e "set folder=$HOME/Mail" -e "set spoolfile=+UnivCS/INBOX" -e "source ~/Mail/muttrc.mailboxes"'
    export todo=~/personal/todo.txt

    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*)
        # Xterm and rxvt use <esc> ] <num> ; <title> <bel>
        #  Where <num> is 0 for both icon name and window title,
        #                 1 for icon name
        #                 2 for window title
        #  \[ and \] are there to have bash ignore unprintable characters
        #PS1='\[\033]0;\h\007\]\h\$ '
        PS1='\h:\!\$ '
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        ;;

    screen)
        # Screen uses "<esc> k <title> <esc> \" for window title
        PS1='\[\033k\h\033\\\]\h\$ '
        ;;
    *)
        # user@host pwd should be provided my WM title bar IMO
        PS1='\h\$ '
        PROMPT_COMMAND=`history -a`
        ;;
    esac

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc).
    if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi

    umask 002

fi

export EMAIL=hendry@iki.fi

# Fucks up some programs (svn) on hosts that don't have these locales I have
#export LANG=en_US.UTF-8
#export LANGUAGE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

export PATH=$PATH:$HOME/projects/scripts
#export CVSROOT=:pserver:hendry@192.168.0.9:/home/cvs/repository/
#export JAVA_HOME=/usr/lib/j2sdk1.5-sun/
