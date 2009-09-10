# If running interactively, then:
if [ "$PS1" ]; then

	export EDITOR=vim
	export VISUAL=vim
	export CVSEDITOR=vim

	# check the window size after each command and, if necessary,
	# update the values of LINES and COLUMNS.
	shopt -s checkwinsize

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
	pol () {
		sudo vim /usr/lib/webvm/policy.conf
	}

 	PS1='\u@\h \W\$ '

	# http://www.cuberick.com/2008/11/update-bash-history-in-realtime.html
	# http://wooledge.org:8000/BashFAQ/088
    unset HISTFILESIZE
	HISTSIZE=10000
	export HISTCONTROL=ignoredups
	shopt -s cmdhist
	PROMPT_COMMAND="history -a"
	export HISTSIZE PROMPT_COMMAND
	shopt -s histappend

	# For my poor cd antics
	shopt -s cdspell
	shopt -s cdable_vars


	# enable programmable completion features (you don't need to enable
	# this, if it's already enabled in /etc/bash.bashrc).
	if [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi

	umask 002

	doc () {
		cd /usr/share/doc/$1
		ls
	}

	alias ac='vim ~/private/personal/accounts'
	alias suspend='sudo s2ram -f -a 3 && slock'

	[ -x /usr/bin/most ] && export PAGER=most
	[ -x /usr/bin/most ] && alias more='most' && alias less='most'

	export EMAIL="hendry@iki.fi"
	export DEBEMAIL="hendry@iki.fi"
	export DEBFULLNAME='Kai Hendry'
	export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

	APLIX_ROOT=/mnt/truecrypt1/aplix

	alias tests="cd $APLIX_ROOT/code/trunk/tests/html"
	alias mods="cd $APLIX_ROOT/code/trunk/modules"
	alias webvm="cd $APLIX_ROOT/code/trunk/webvm"
	export WEBVMHOME="$APLIX_ROOT/code/trunk/webvm"
	alias wiki="cd $APLIX_ROOT/wiki"
	alias itest="$APLIX_ROOT/runtest/runtest.sh"
	alias scan="sudo iwlist wlan0 scan"

	xbacklight -set 100 2>/dev/null # max brightness please

	# disable terminal flow control
	stty -ixoff

	complete -cf sudo

	if [ -d /home/hendry/android-sdk-linux_x86-1.5_r1/tools ] ; then
		PATH=/home/hendry/android-sdk-linux_x86-1.5_r1/tools:/home/hendry/bondi/widl/obj:"${PATH}"
	fi
	if test -d /home/hendry/depot_tools
	then
		PATH=${PATH}:/home/hendry/depot_tools
	fi

	upload() {
	curl -F key=kensentme2 -F f=@$1 http://upload.natalian.org
	ssh -A hetty.webconverger.org /srv/www/static-sync.sh
	}

fi

GREP_OPTIONS="--exclude-dir=\.svn"
export GREP_OPTIONS
