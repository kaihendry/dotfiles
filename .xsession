# black background
xsetroot -solid "#000000"

feh --bg-center /home/hendry/media/bg/ibm.gif

WIDTH=`xwininfo -root | grep Width | cut -d":" -f2`
WIDTH=`expr $WIDTH - 20`
WIDTH=${WIDTH}"x150-10-50"

# make sure you have perms on /var/log/messages `sudo adduser $USER adm`
root-tail -g $WIDTH -f /var/log/messages,white /var/log/syslog,yellow


xmodmap ~/.Xmodmap
/usr/bin/iceweasel -P default &
#/home/hendry/firefox/firefox/firefox -P default &

x-terminal-emulator -e screen -UR &

INTERFACE=$(/sbin/route | grep default | awk '{print $NF}')

while true
do

	CAP=$(cat /proc/acpi/battery/BAT0/info | sed -n 's/last full capacity:\s*\([0-9]*\) mWh/\1/p')
	BAT=$(cat /proc/acpi/battery/BAT0/state | sed -n 's/remaining capacity:\s*\([0-9]*\) mWh/\1/p')
	LEFT=$(echo "$BAT * 100 / $CAP" | bc)
	xsetroot -name "$LEFT% `date +'%R %b %d '` `uptime | sed 's/.*,//'`"
	sleep 1
done &

exec /home/hendry/debian/dwm/dwm
