# black background
xsetroot -solid "#000000"

#feh --bg-scale /home/hendry/porn/bgs/abstract.jpg
feh --bg-center /home/hendry/private/1906309765_44a9f6b2a2_o.gif


WIDTH=`xwininfo -root | grep Width | cut -d":" -f2`
WIDTH=`expr $WIDTH - 20`
WIDTH=${WIDTH}"x150-10-50"
# make sure you have perms on /var/log/messages `sudo adduser $USER adm`
root-tail -g $WIDTH -fn fixed -f /var/log/messages,white /var/log/syslog,yellow

#/usr/bin/persistent-browser &
/usr/bin/iceweasel -P default &

x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
echo $(yacpi -t -c -p -b) FAN $(cat /proc/acpi/ibm/fan | grep "^level" | awk '{print $NF}') $(date +"%R %b %d")
sleep 5
done | /usr/bin/dwm
} || exec x-window-manager
