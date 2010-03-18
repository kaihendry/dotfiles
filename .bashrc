if test "$PS1"
then

	export EDITOR=vim
	export VISUAL=vim
	export CVSEDITOR=vim

	# check the window size after each command and, if necessary,
	# update the values of LINES and COLUMNS.
	shopt -s checkwinsize

	alias ll='ls -alh --group-directories-first --color=always'

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
	export JAVA_HOME=/usr/lib/jvm/jdk1.5.0_22

	if test -d $JAVA_HOME/bin
	then
		export PATH=$JAVA_HOME/bin:${PATH}
	fi

	APLIX_ROOT=/mnt/truecrypt1/aplix

	a() { if test -d $APLIX_ROOT
			  then
				  cd $APLIX_ROOT
			  else
				  truecrypt ~/crypt /mnt/truecrypt1
			  fi
		  }

	alias wiki="cd $APLIX_ROOT/public-wiki"
	alias scan="sudo iwlist wlan0 scan"

	xbacklight -set 100 2>/dev/null # max brightness please

	# disable terminal flow control
	stty -ixon

	complete -cf sudo

	ANDROID_TOOLS=/home/hendry/android-sdk-linux/tools
	if test -d $ANDROID_TOOLS
	then
		export GDK_NATIVE_WINDOWS=true
		PATH=${PATH}:$ANDROID_TOOLS
	fi

	DEPOT_TOOLS=/home/hendry/depot_tools
	if test -d $DEPOT_TOOLS
	then
		PATH=${PATH}:$DEPOT_TOOLS
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
		if test "$(uname -m)" = "x86_64"
		then
			export GOARCH=amd64
		else
			export GOARCH=386
		fi
	fi

	if test -d $HOME/bin
	then
		export PATH=$HOME/bin:${PATH}
	fi

	GREP_OPTIONS="--exclude-dir=\.svn"
	export GREP_OPTIONS
	alias widgets="cd /mnt/truecrypt1/aplix/webvm/trunk/widgets"

fi
