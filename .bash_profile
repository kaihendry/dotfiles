# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# the rest of this file is commented out.

# include .bashrc if it exists

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# do the same with MANPATH
if [ -d ~/man ]; then
    MANPATH=~/man:"${MANPATH}"
    export MANPATH
fi

# /etc/inittab
# 1:2345:respawn:/sbin/mingetty --autologin hendry tty1
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
  startx
fi

if [ $HOSTNAME == 'won.local' ]; then
test -r /sw/bin/init.sh && . /sw/bin/init.sh
fi
