# black background
xsetroot -solid "#000000"

feh --bg-center /home/hendry/media/bg/ibm.gif

WIDTH=`xwininfo -root | grep Width | cut -d":" -f2`
WIDTH=`expr $WIDTH - 20`
WIDTH=${WIDTH}"x150-10-50"
# make sure you have perms on /var/log/messages `sudo adduser $USER adm`
root-tail -g $WIDTH -f /var/log/messages,white /var/log/syslog,yellow

#/usr/bin/persistent-browser &
/usr/bin/iceweasel -P default &

x-terminal-emulator -e screen -UR &

[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true
do
echo $(yacpi -t -c -p -b) FAN $(cat /proc/acpi/ibm/fan | grep "^level" | awk '{print $NF}') $(date +"%R %b %d")
sleep 5
done | /home/hendry/debian/dwm/dwm/dwm
} || exec x-window-manager
