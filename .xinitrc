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

#iceweasel -P default & # Run browser on startup
#~/firefox/firefox -P default &

# I have a dual screen setup. LVDS is my laptop's screen. VGA is my Samsung.
#xrandr --output LVDS1 --mode 1024x768
#xrandr --output VGA1 --mode 1680x1050
#xrandr --output LVDS1 --left-of VGA1

#set statusbar
while true
do
	if acpi -a | grep off-line > /dev/null; then
		xsetroot -name "Bat. $( acpi -b | awk '{ print $4 " " $5 }' | tr -d ',' ) | Vol. $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | $(date +"%a, %b %d %R")"
	else
		xsetroot -name "Vol. $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | $(date +"%a, %b %d %R")"
	fi
	sleep 1s
done &

exec dwm
