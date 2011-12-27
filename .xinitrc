#!/bin/sh
# for terminus font in Archlinux :(
xset +fp /usr/share/fonts/local
xset fp rehash

xset -b # disable bell
eval `/usr/bin/ssh-agent`

if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
then
	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
fi

if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

# 1280x720 = 720p
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date --rfc-3339=date).jpg &

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout gb -option ctrl:nocaps

hash chromium && chromium &

while true
do
	MUTED=""
	if amixer get Master,0 | grep -q off
	then
		MUTED="Muted"
	fi

	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	OTHERTIME=$(TZ=Europe/London date +%Z\=%H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)

	if acpi -a | grep off-line > /dev/null
	then
		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		xsetroot -name "$IP $BAT $MUTED $LOCALTIME $OTHERTIME"
	else
		xsetroot -name "$IP $MUTED $LOCALTIME $OTHERTIME"
	fi
	sleep 20s
done &

dwm
