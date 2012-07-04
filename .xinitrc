#!/bin/bash
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

# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout gb -option ctrl:nocaps

hash chromium && chromium &

while true
do
	dwm
done &

while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	BST=$(TZ=Asia/Singapore date +%Z\=%H:%M)
	PDT=$(TZ=America/Los_Angeles date +%Z\=%H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

	if acpi -a | grep off-line > /dev/null
	then
		BAT="$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		xsetroot -name "$IP BAT:$BAT VOL:$VOL $TEMP $LOCALTIME $BST $PDT"
	else
		xsetroot -name "$IP $VOL $TEMP $LOCALTIME $BST $PDT"
	fi
	sleep 20s
done
