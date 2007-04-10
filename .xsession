# background
xsetroot -solid "#000000"
feh --bg-scale /home/hendry/downloads/daisy.jpg

/usr/bin/iceweasel &
x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
#echo `yacpi -s 10 -t | sed -e 's/cpu.*//;t ;d'` `date --iso-8601=minutes` `uptime | sed 's/.*://; s/,//g'`
echo 1
sleep 5
done | /usr/bin/dwm.user
} || exec x-window-manager


