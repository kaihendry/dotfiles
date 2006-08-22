x-www-browser &
x-terminal-emulator -e screen -UR &
if [ $HOSTNAME == "puti" ]; then spicctrl -b 192; fi
exec x-window-manager
