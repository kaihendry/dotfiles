# background
xsetroot -solid "#000000"
#xloadimage -onroot -fullscreen ~/bgs/birthday\ card.jpg
xloadimage -onroot -fullscreen ~/pictures/ruth+bariloche/sd/dcim/101canon/img_2388.jpg

WIDTH=`xwininfo -root | grep Width | cut -d":" -f2`
WIDTH=`expr $WIDTH - 20`
WIDTH=${WIDTH}"x150-10-50"
root-tail -g $WIDTH -fn fixed --frame -f /var/log/messages,black /var/log/syslog,brown

#/usr/bin/persistent-browser &

/usr/bin/iceweasel -P default &

x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
echo `yacpi -s 10 -t | sed -e 's/cpu.*//;t ;d'` `date --iso-8601=minutes` `uptime | sed 's/.*://; s/,//g'`
sleep 5
done | /usr/bin/dwm
} || exec x-window-manager
#/usr/bin/dwm
