#!/bin/bash

sdir=${sdir:-$HOME/Downloads} # source directory
wdir=${wdir:-$HOME/dl} # web directory

test -d "$sdir" || exit

np="$(mktemp -d)/manage-$$"
mkfifo "$np" || exit

inotifywait -m -e CLOSE_WRITE "$sdir" > "$np" & ipid=$!

trap 'kill $ipid; rm -f $np' EXIT

while read -r dir _ fn
do

	case "${fn##*.}" in

	crdownload)
		echo "Ignoring $fn"
		;;

	*)
		od="$wdir/$(date +%Y-%m-%d)"
		ofn="$od/$fn" # output file name
		mkdir -p "$od" || true
		mv -v "${dir}${fn}" "$ofn"
		ln -sf "$ofn" "${dir}${fn}"
		;;

	esac

done < "$np"
