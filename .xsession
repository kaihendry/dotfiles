# background
xsetroot -solid "#000000"
#xloadimage -onroot -fullscreen ~/bgs/trees.jpg
feh --bg-scale /home/hendry/porn/bgs/abstract.jpg

WIDTH=`xwininfo -root | grep Width | cut -d":" -f2`
WIDTH=`expr $WIDTH - 20`
WIDTH=${WIDTH}"x150-10-50"

# make sure you have perms on /var/log/messages
root-tail -g $WIDTH -fn fixed -f /var/log/messages,white /var/log/syslog,yellow

#/usr/bin/persistent-browser &

/usr/bin/iceweasel -P default &

x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
# yacpi gives a nice display of my battery info
echo $(yacpi -p -b) $(date +"%R %b %d") # for yacpi >> 3.0
sleep 5
done | /usr/bin/dwm
} || exec x-window-manager
