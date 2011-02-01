# /etc/inittab
# 1:2345:respawn:/sbin/mingetty --autologin hendry tty1
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
  startx
fi
