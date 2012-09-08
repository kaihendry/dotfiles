#!/bin/bash

[ -f ~/.xprofile ] && . ~/.xprofile

# for terminus font in Archlinux :(
xset +fp /usr/share/fonts/local
xset fp rehash

xset -b # disable bell
eval `/usr/bin/ssh-agent`

xset -dpms
xset s off

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout gb -option ctrl:nocaps

hash conky && conky &
hash chromium && chromium &
#firefox

while true
do
	dwm
done &

while true
do
	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)

	if acpi -a | grep off-line > /dev/null
	then
		xsetroot -name "$LOCALTIME"
	else
		xsetroot -name "$LOCALTIME"
	fi
	sleep 20s
done
