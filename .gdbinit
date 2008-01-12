# d32:~/svn/WebKit/WebKitBuild/Release/WebKitTools/GtkLauncher% gdb -tui GtkLauncher
set auto-solib-add on
show auto-solib-add

set print demangle
show print demangle
set print asm-demangle
show print asm-demangle
set exceptions true
show debugexceptions

set breakpoint pending on
show breakpoint pending

define jsx
    #b NP_Initialize
    b NPP_GetValue
    run http://plugin.webvm.net
end
