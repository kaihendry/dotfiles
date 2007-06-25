# background
xsetroot -solid "#000000"
xloadimage -onroot -fullscreen birthday\ card.jpg
root-tail --frame -f /var/log/messages,black /var/log/syslog,brown

/usr/bin/persistent-browser &

#/usr/bin/iceweasel -P default &

x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
echo `yacpi -s 10 -t | sed -e 's/cpu.*//;t ;d'` `date --iso-8601=minutes` `uptime | sed 's/.*://; s/,//g'`
sleep 5
done | /usr/bin/dwm.user
} || exec x-window-manager
