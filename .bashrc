# As of 2007 I use zsh-beta and .zshrc a bit more

# If running interactively, then:
if [ "$PS1" ]; then

    export EDITOR=vim
    export VISUAL=vim
    export CVSEDITOR=vim

    export HISTCONTROL=ignoredups
    shopt -s cmdhist

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize
    shopt -s histappend

    # enable color support of ls and also add handy aliases
    if [ "$TERM" != "dumb" ]; then
        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
        eval `dircolors -b`
        alias ls='ls --color=auto'
        fi
    fi

    alias h='cat ~/.bash_history.archive | grep -i'

    # some more ls aliases
    alias ll='ls -alh --color=always'
    alias todo='vim /home/hendry/projects/webconverger/webconverger.org/TODO'

    # for offline mail reading
    alias mutto='mutt -e "set folder=$HOME/Mail" 
                 -e "set record=+dabase/INBOX.Sent.`date +%Y-%m`" 
                 -e "set spoolfile=+dabase/INBOX" 
                 -e "source ~/Mail/muttrc.mailboxes"'
#
    alias muttl='mutt -e "set folder=$HOME/Mail" -e "set record=+dabase/INBOX.Sent.`date +%Y-%m`" -e "set spoolfile=+dabase/INBOX" -e "source ~/Mail/muttrc.mailboxes"'


    # wc -l $todo 
    export todo=~/personal/todo.txt

    source ~/.bashrc_history.sh

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
export DEBEMAIL=hendry@iki.fi
export DEBFULLNAME='Kai Hendry'

export PATH=$PATH:$HOME/projects/scripts

#export http_proxy=http://localhost:3128/
