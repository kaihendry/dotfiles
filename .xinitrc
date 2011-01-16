#!/bin/sh
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
setxkbmap gb # british keyboard

#iceweasel -P default & # Run browser on startup
#~/firefox/firefox -P default &

# I have a dual screen setup. LVDS is my laptop's screen. VGA is my Samsung.
#xrandr --output LVDS1 --mode 1024x768
#xrandr --output VGA1 --mode 1680x1050
#xrandr --output LVDS1 --left-of VGA1

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

if test -x /home/hendry/debian/dwm/dwm
then
	exec /home/hendry/debian/dwm/dwm
else
	dwm
fi
