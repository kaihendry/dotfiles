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

# AutoCutSel.
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

while true
do
	dwm
done &

while true
do
	localtime=$(date +%Z\=%Y-%m-%dT%H:%M)
	bandwidth=$(grep $(ip route | egrep '^default' | sed -nr 's/.*dev (\S+).*/\1/p') /proc/net/dev | awk '{printf("Down %.2f Up %.2f", $2 / 1048576, $10 / 1048576);}')
	xsetroot -name "$localtime $bandwidth"
	sleep 20s
done
