#!/bin/bash


exec >/tmp/startx$$.log 2>&1

# Prefer /usr/local/bin
export PATH="/usr/local/bin:$PATH"
echo PATH: $PATH

set -x

[ -f ~/.xprofile ] && source ~/.xprofile

xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell

SSH_ENV=$HOME/.ssh/environment
ssh-agent > ${SSH_ENV}
chmod 600 ${SSH_ENV}
. ${SSH_ENV} > /dev/null

# https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling#Prevent_screen_from_turning_off
#xset -dpms
xset s off

if test -f /usr/lib/ssh/x11-ssh-askpass
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

# Get PulseAudio working ... *sigh*
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout gb -option ctrl:nocaps
xset m 18/10 0 # http://www.x.org/wiki/Development/Documentation/PointerAcceleration

browser=google-chrome-unstable
#browser=chromium

hash $browser && $browser &

#test -e ~/bin/surf-open.sh && ~/bin/surf-open.sh http://gmail.com
#hash fcitx && fcitx &

clipmenud &
dwm_status &

#while :; do sinac -w 300 && slock; done &

exec /home/hendry/suckless/dwm/dwm 2> ~/tmp/dwm.log

