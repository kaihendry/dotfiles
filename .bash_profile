# /etc/inittab setup like so:
# 1:2345:respawn:/sbin/mingetty --autologin hendry tty1
if test -z "$DISPLAY" && test $(tty) == /dev/tty1
then
  startx
fi
