[[ -f ~/.bashrc ]] && . ~/.bashrc
xlog=/tmp/xorg.log
if ! test -s $xlog
then
	exec xinit -- vt$XDG_VTNR -keeptty -nolisten tcp > $xlog 2>&1
fi
