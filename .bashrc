export EDITOR=vim
export VISUAL=vim
export CVSEDITOR=vim
export EMAIL="hendry@iki.fi"
export DEBEMAIL="hendry@iki.fi"
export DEBFULLNAME='Kai Hendry'
export JAVA_HOME=/opt/java

GREP_OPTIONS="--exclude-dir=\.svn"
export GREP_OPTIONS

shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
# For my poor typing antics
shopt -s cdspell
shopt -s cdable_vars

# disable terminal flow control
stty -ixon

complete -cf sudo

PS1='\u@\h \W\$ '

unset HISTFILESIZE
HISTSIZE=10000
PROMPT_COMMAND="history -a"
export HISTCONTROL=ignoredups
export HISTSIZE PROMPT_COMMAND

umask 002

test -x /usr/bin/most  && export PAGER=most
test -x /usr/bin/most  && alias more='most' && alias less='most'

if test -d $JAVA_HOME/bin
then
	export PATH=$JAVA_HOME/bin:${PATH}
fi

xbacklight -set 100 2>/dev/null # max brightness please

if test -d ~/android-sdk-linux
then
	export PATH="$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools"
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

function usbtether {
	ifconfig usb0 up && dhcpcd usb0
}

function vsig {
curl --anyauth --user "wacspecs:onepoint0" -F "widget=@$1" -F "verbose=1 " -F "v=1" -n http://v.wacapps.net/upload.php
}

alias ll='ls -alh --group-directories-first --color=always'
alias ac='vim ~/private/personal/accounts'
alias suspend='sudo pm-suspend'
alias scan="sudo iwlist wlan0 scan"
alias rejoin="sudo wpa_action wlan0 reload"
alias recordandroid="recordmydesktop -x 30 -y 47 --width 320 --height 480 --no-sound -o foo.ogv"
