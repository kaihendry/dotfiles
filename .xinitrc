#!/bin/bash -x

exec >/tmp/startx$$.log 2>&1

systemctl --user import-environment DISPLAY

[ -f ~/.xprofile ] && source ~/.xprofile

test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
xset fp rehash

xset -b # disable bell

if test -f /usr/lib/ssh/x11-ssh-askpass; then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add </dev/null
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

setxkbmap -model thinkpad -layout us -option caps:none
xset m 5 1

# firefox -P hendry &

~/bin/dwm_status &
xss-lock -- /usr/bin/slock &
export CM_MAX_CLIPS=0
export CM_DIR=$HOME/clip_history/
clipmenud &

xrandr --output eDP --set TearFree on

# https://unix.stackexchange.com/a/367016/27433
setxkbmap -option altwin:swap_alt_win

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

exec /usr/local/bin/dwm 2>~/tmp/dwm.log
