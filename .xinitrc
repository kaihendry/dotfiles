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

while true
do
	xsetroot -name "$(acpi -b | sed -r 's/^[^,]+,//') $(date +'%R %b %d ') $(uptime | sed 's/.*,//')"
	sleep 10
done &
exec dwm
