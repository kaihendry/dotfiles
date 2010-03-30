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

define efence
        set environment EF_PROTECT_BELOW 0
        set environment LD_PRELOAD /usr/lib/libefence.so.0.0
        echo Enabled Electric Fence\n
end
document efence
Enable memory allocation debugging through Electric Fence (efence(3)).
        See also nofence and underfence.
end


define underfence
        set environment EF_PROTECT_BELOW 1
        set environment LD_PRELOAD /usr/lib/libefence.so.0.0
        echo Enabled Electric Fence for undeflow detection\n
end
document underfence
Enable memory allocation debugging for underflows through Electric Fence 
(efence(3)).
        See also nofence and efence.
end


define nofence
        unset environment LD_PRELOAD
        echo Disabled Electric Fence\n
end
document nofence
Disable memory allocation debugging through Electric Fence (efence(3)).
end
