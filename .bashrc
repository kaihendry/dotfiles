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

	# some more ls aliases
	alias ll='ls -alh --color=always'

	PS1='\u@\h \W\$ '

	unset HISTFILESIZE
	HISTSIZE=10000
	export HISTCONTROL=ignoredups
	shopt -s cmdhist
	PROMPT_COMMAND="history -a"
	export HISTSIZE PROMPT_COMMAND
	shopt -s histappend

	# For my poor typing antics
	shopt -s cdspell
	shopt -s cdable_vars

	umask 002

	alias ac='vim ~/private/personal/accounts'
	alias suspend='sudo s2ram -f -a 3 && slock'

	[ -x /usr/bin/most ] && export PAGER=most
	[ -x /usr/bin/most ] && alias more='most' && alias less='most'

	export EMAIL="hendry@iki.fi"
	export DEBEMAIL="hendry@iki.fi"
	export DEBFULLNAME='Kai Hendry'
	export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

	APLIX_ROOT=/mnt/truecrypt1/aplix

	export WEBVMHOME="$APLIX_ROOT/webvm/trunk/webvm"
	alias wiki="cd $APLIX_ROOT/public-wiki"
	alias scan="sudo iwlist wlan0 scan"

	xbacklight -set 100 2>/dev/null # max brightness please

	# disable terminal flow control
	stty -ixon

	complete -cf sudo

	ANDROID_TOOLS=/home/hendry/android/tools
	if test -d $ANDROID_TOOLS
	then
		PATH=${PATH}:$ANDROID_TOOLS
	fi

	if test -f $HOME/.ssh/key
	then
		upload() {
			. $HOME/.ssh/key
			curl -F key=$KEY -F f=@$1 http://upload.natalian.org
			ssh -A hetty.webconverger.org /srv/www/static-sync.sh
		}
	fi

	if test -d $HOME/go
	then
		export GOROOT=$HOME/go
		export GOOS=linux
		export GOARCH=386
	fi

	if test -d $HOME/bin
	then
		export PATH=$HOME/bin:${PATH}
	fi

	GREP_OPTIONS="--exclude-dir=\.svn"
	export GREP_OPTIONS

fi
