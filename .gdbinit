# d32:~/svn/WebKit/WebKitBuild/Release/WebKitTools/GtkLauncher% gdb -tui GtkLauncher
set auto-solib-add on
show auto-solib-add


set print demangle
show print demangle
set print asm-demangle
show print asm-demangle
#set exceptions true
#show print debugexceptions
show print pretty

set breakpoint pending on
show breakpoint pending

define webvm
cd /home/hendry/aplix/code/trunk/webvm
#b NP_Initialize
#b NPP_GetValue
#file /usr/lib/webvm/npwebvm.so
run
end

define wm
set args -d
set follow-fork-mode child
run
end
