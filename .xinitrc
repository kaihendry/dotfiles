#!/bin/sh
eval `/usr/bin/ssh-agent`
SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap

while true
do
	echo "$(acpi -b) $(date +'%R %b %d ') $(uptime | sed 's/.*,//')"
	sleep 10
done | dwm
