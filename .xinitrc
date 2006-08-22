xmodmap ~/.Xmodmap

#[ /etc/alternatives/x-window-manager -ef /usr/bin/dwm ] && {
while true                                                                                                   
do                                                                                                           
    echo `date` `uptime | sed 's/.*://; s/,//g'`                                                             
    sleep 1                                                                                                  
done | dwm
#}
