# background
xsetroot -solid "#FFFFFF"
#xloadimage -onroot -fullscreen ~/bgs/trees.jpg
feh --bg-scale ~/bgs/trees.jpg

WIDTH=`xwininfo -root | grep Width | cut -d":" -f2`
WIDTH=`expr $WIDTH - 20`
WIDTH=${WIDTH}"x150-10-50"
#root-tail -g $WIDTH -fn fixed --frame -f /var/log/messages,black /var/log/syslog,brown
root-tail -g $WIDTH -fn fixed -f /var/log/messages,white /var/log/syslog,yellow

#/usr/bin/persistent-browser &

/usr/bin/iceweasel -P default &

x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
echo $(yacpi -p -b) $(date +"%R %b %d") # for yacpi >> 3.0
sleep 5
done | /usr/bin/dwm
} || exec x-window-manager
#/usr/bin/dwm
