#!/bin/bash
exec >/tmp/startx$$.log 2>&1
set -x

xset +fp /usr/share/fonts/local
xset fp rehash

xset -b # disable bell

eval `/usr/bin/ssh-agent`

xset -dpms
xset s off

if test -f /usr/lib/ssh/x11-ssh-askpass
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

while true
do
	dwm
done &

while true
do
	localtime=$(date +%Z\=%Y-%m-%dT%H:%M)
	xsetroot -name "$localtime"
	sleep 20s
done
