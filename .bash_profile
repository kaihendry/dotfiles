[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] || return
xlog=~/xorg/$(date +%s).log
exec xinit -- vt$XDG_VTNR -keeptty -nolisten tcp > "$xlog" 2>&1
