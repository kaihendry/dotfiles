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
	alias suspend='sudo pm-suspend'

	[ -x /usr/bin/most ] && export PAGER=most
	[ -x /usr/bin/most ] && alias more='most' && alias less='most'

	export EMAIL="hendry@iki.fi"
	export DEBEMAIL="hendry@iki.fi"
	export DEBFULLNAME='Kai Hendry'
	export JAVA_HOME=/opt/java

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
				  cd $APLIX_ROOT
			  fi
		  }

	alias wiki="cd $APLIX_ROOT/public-wiki"
	alias scan="sudo iwlist wlan0 scan"
	alias rejoin="sudo wpa_action wlan0 reload"

	xbacklight -set 100 2>/dev/null # max brightness please

	# disable terminal flow control
	stty -ixon

	complete -cf sudo

	if test -d ~/android-sdk-linux/
	then
		export GDK_NATIVE_WINDOWS=true
		export PATH=~/android-sdk-linux/platform-tools:~/android-sdk-linux/tools:${PATH}
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

	function usbtether {
		ifconfig usb0 up && dhcpcd usb0
	}

	GREP_OPTIONS="--exclude-dir=\.svn"
	export GREP_OPTIONS
	alias widgets="cd /mnt/truecrypt1/aplix/webvm/trunk/widgets"
	alias recordandroid="recordmydesktop -x 30 -y 47 --width 320 --height 480 --no-sound -o foo.ogv"

	function vsig {
	curl --anyauth --user "wacspecs:onepoint0" -F "widget=@$1" -F "verbose=1 " -F "v=1" -n http://v.wacapps.net/upload.php
}

fi
