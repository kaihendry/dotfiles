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
#/home/hendry/firefox/firefox/firefox &
#/home/hendry/ff3/firefox/firefox &

x-terminal-emulator -e screen -UR &

SLEEP=1
INTERFACE=$(/sbin/route | grep default | awk '{print $NF}')
RXB=`cat /sys/class/net/${INTERFACE}/statistics/rx_bytes`
TXB=`cat /sys/class/net/${INTERFACE}/statistics/tx_bytes`

while true
do

    # get new rx/tx counts
    RXBN=`cat /sys/class/net/${INTERFACE}/statistics/rx_bytes`
    TXBN=`cat /sys/class/net/${INTERFACE}/statistics/tx_bytes`

    # calculate the rates
    # format the values to 4 digit fields
    RXR=$(printf "%4d" $(echo "($RXBN - $RXB) / 1024/${SLEEP}" | bc))
    TXR=$(printf "%4d" $(echo "($TXBN - $TXB) / 1024/${SLEEP}" | bc))
	echo -n "$(acpi -b) "
	# The Unicode up&down arrow glyphs require a Unicode setup, e.g.:
	#  -*-fixed-*-*-*-*-*-*-*-*-*-*-*-*
	echo -n ${RXR}kB/s↓${TXR}kB/s↑
	echo $(date +"%R %b %d")

	# reset old rates
    RXB=$RXBN; TXB=$TXBN

	sleep $SLEEP

done | /home/hendry/debian/dwm/dwm
