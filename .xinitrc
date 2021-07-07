#!/bin/bash -x

#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

exec >/tmp/startx$$.log 2>&1

# Prefer /usr/local/bin
export PATH="/usr/local/bin:$PATH"
echo PATH: $PATH

[ -f ~/.xprofile ] && source ~/.xprofile

test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell

# SSH_ENV=$HOME/.ssh/environment
# ssh-agent | grep -v echo > ${SSH_ENV}
# chmod 600 ${SSH_ENV}
# . ${SSH_ENV} > /dev/null

# https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling#Prevent_screen_from_turning_off
#xset -dpms
xset s off

if test -f /usr/lib/ssh/x11-ssh-askpass
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi


# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

setxkbmap -model thinkpad -layout us -option caps:escape
xset m 5 1

x-www-browser &

~/bin/dwm_status &

# https://bbs.archlinux.org/viewtopic.php?pid=1695649#p1695649
# DISABLED default of sleeping on lid close ~/.config/systemd/user/inhibit-lid-sleep-on-battery.service
while true
do
	if [[ $(< /proc/acpi/button/lid/LID/state) = *closed ]]
	then
		logger Lid closed
		case $(< /sys/class/power_supply/AC/online) in
			1)  ( [[ ! "$(pidof slock)" ]] && slock ) ;;
			0) logger "suspending..."; systemctl suspend ;;
		esac
	fi
	sleep 2
done &

#xautolock -time 10 -locker slock &
xss-lock -- /usr/bin/slock &

# https://bbs.archlinux.org/viewtopic.php?id=66453
xmodmap ~/.Xmodmap &&

alias vim="TERM=xterm-256color vim"

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

#picom & # try fix tearing

xrandr --output eDP --set TearFree on

export CM_DIR=/home/hendry/clip_history/
clipmenud &

exec /usr/local/bin/dwm 2> ~/tmp/dwm.log
