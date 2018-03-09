[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] || return
xlog=~/xorg/$(date +%s).log
# read -p "Start Xorg? " -n 1 -r
# echo    # (optional) move to a new line
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
	exec xinit -- vt$XDG_VTNR -keeptty -nolisten tcp > "$xlog" 2>&1
# fi
