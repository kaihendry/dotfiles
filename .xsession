x-www-browser &
x-terminal-emulator -e screen -UR &

# one machine I was on needed this to ramp up the brightness
if [ $HOSTNAME == "puti" ]; then spicctrl -b 192; fi

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
echo `date` `uptime | sed 's/.*://; s/,//g'`
sleep 1
done | dwm
} || exec x-window-manager

# background
#feh --bg-scale
