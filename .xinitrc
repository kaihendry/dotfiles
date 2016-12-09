#!/bin/bash -x

exec >/tmp/startx$$.log 2>&1

# Prefer /usr/local/bin
export PATH="/usr/local/bin:$PATH"
echo PATH: $PATH

[ -f ~/.xprofile ] && source ~/.xprofile

test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell

SSH_ENV=$HOME/.ssh/environment
ssh-agent | grep -v echo > ${SSH_ENV}
chmod 600 ${SSH_ENV}
. ${SSH_ENV} > /dev/null


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

google-chrome-unstable --force-device-scale-factor=1.5 &
#firefox &

#xsetroot -solid steelblue

#xcompmgr -c &
# xbattmon &

~/bin/dwm_status &

# https://bbs.archlinux.org/viewtopic.php?id=66453
xmodmap ~/.Xmodmap &&
exec dwm 2> ~/tmp/dwm.log
