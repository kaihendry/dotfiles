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

xset -dpms
xset s off

if test -f /usr/lib/ssh/x11-ssh-askpass
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

# 1280x720 = 720p X220
hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -merge $HOME/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -layout gb -option ctrl:nocaps
xset m 18/10 0 # http://www.x.org/wiki/Development/Documentation/PointerAcceleration

# hash google-chrome && google-chrome &
firefox &

#test -e ~/bin/surf-open.sh && ~/bin/surf-open.sh http://gmail.com
#hash fcitx && fcitx &

dwm_status &

pulseaudio --start

exec /home/hendry/suckless/dwm/dwm 2> ~/tmp/dwm.log
