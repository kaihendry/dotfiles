# start X at login
if status --is-login
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		exec startx
	end
end

alias c="sudo chroot ~/debian/sid-root/root/webconverger/chroot env -i GIT_AUTHOR_NAME='Kai Hendry' PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
alias b="sudo chroot ~/debian/sid-root env -i PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash"
alias i="cd ~/debian/sid-root/root/webconverger"

function up
	cd ~/debian/sid-root/root/webconverger/chroot
	git push
end

function r4
	cvlc http://bbc.co.uk/radio/listen/live/r4.asx
end

function p
	curl -n -F 'f:1=<-' http://ix.io
end

set -x EMAIL "hendry@webconverger.com"
set -x GIT_AUTHOR_NAME "Kai Hendry"
set -x GIT_COMMITTER_NAME "Kai Hendry"
set -x GIT_COMMITTER_EMAIL "hendry@webconverger.com"
set -x GIT_AUTHOR_EMAIL "hendry@webconverger.com"
set -x NODE_PATH "/usr/lib/node_modules/"
set -x GOPATH ~/go
set -U EDITOR vim


set -U fish_greeting ""

if status --is-login
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		exec startx
	end
end

if status --is-interactive
    set PATH $PATH ~/bin
end

