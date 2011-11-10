#!/bin/sh
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

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout gb -option ctrl:nocaps

test -x /usr/bin/chromium && /usr/bin/chromium &

while true
do
	MUTED=""
	if amixer get Master,0 | grep -q off
	then
		MUTED="Muted"
	fi

	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	WESTCOAST=$(TZ=America/Los_Angeles date +%Z\=%H:%M)

	if acpi -a | grep off-line > /dev/null
	then
		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		xsetroot -name "$BAT $MUTED $LOCALTIME $WESTCOAST"
	else
		xsetroot -name "$MUTED $LOCALTIME $WESTCOAST"
	fi
	sleep 20s
done &

dwm
