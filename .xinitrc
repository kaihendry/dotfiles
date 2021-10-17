#!/bin/bash -x

xrandr --auto
# Mirror display
mons -m

exec >/tmp/startx$$.log 2>&1

systemctl --user import-environment DISPLAY

# Prefer /usr/local/bin
export PATH="/usr/local/bin:$PATH"
echo PATH: $PATH

[ -f ~/.xprofile ] && source ~/.xprofile

test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell

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

# firefox -P hendry &

~/bin/dwm_status &

xss-lock -- /usr/bin/slock &

export CM_MAX_CLIPS=0
export CM_DIR=$HOME/clip_history/
clipmenud &

# https://support.zoom.us/hc/en-us/articles/202082128-Black-screen-during-screen-sharing
xcompmgr &

xrandr --output DisplayPort-0 --set TearFree on

# to get my numpad working
numlockx

exec /usr/local/bin/dwm 2> ~/tmp/dwm.log
