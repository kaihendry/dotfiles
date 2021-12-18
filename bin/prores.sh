#!/bin/bash
if ! test "${1##*.}" == "mkv"; then
	echo "$1" is not Matroska data
	exit
fi

output="/tmp/$(basename "$1" .mkv).mov"

ffmpeg -hide_banner -loglevel error -i "$1" -c:v copy -vtag avc1 -c:a pcm_s24le -f mov -movflags +faststart "$output"

du -sh "$output"
echo scp "$output" mbp:
