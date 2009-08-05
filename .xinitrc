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

iceweasel -P default & # Run browser on startup
#~/firefox/firefox -P default &

# I have a dual screen setup. LVDS is my laptop's screen. VGA is my Samsung.
xrandr --output LVDS --mode 1024x768
xrandr --output VGA --mode 1680x1050
xrandr --output LVDS --left-of VGA

while true
do
	xsetroot -name "$(acpi -b | sed -r 's/^[^,]+,//') $(date +'%R %b %d ') $(uptime | sed 's/.*,//')"
	sleep 10
done & # run in subshell

exec /home/hendry/debian/suckless/dwm/dwm
