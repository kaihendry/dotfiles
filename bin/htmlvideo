#!/bin/bash -e
# https://trac.ffmpeg.org/wiki/Hardware/VAAPI

if ! ffmpeg -version | head -n1 1>&2
then
	echo Missing ffmpeg
	exit 1
fi

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-w] [FILE]
convert video file for the Web

    -w          overwrite input file
EOF
}

overwrite=0

OPTIND=1

while getopts wh opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        w)  overwrite=$((overwrite+1))
            ;;
        *)
            show_help >&2
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))"   # Discard the options and sentinel --

input="$1"

if ! test -f "$input"
then
	echo Missing RAW file to encode to MP4
	exit
fi

eval $(ffprobe -v 0 -of flat=s=_ -show_format "$input") # neat trick to get video variables into shell
eval $(ffprobe -v 0 -of flat=s=_ -show_streams "$input")

if test "$format_tags_creation_time" # try get date from video's metadata
then
	today=$(echo $format_tags_creation_time | awk '{print $1}' | cut -c-10)
fi

test "$today" || today="$(date +%Y-%m-%d)"
output=$today/$(basename "${input%.*}").mp4

if test -f "${output}"
then
	readlink -f ${output}
	exit
fi

mkdir "$today" &>/dev/null || true

if ! FFREPORT=file=/tmp/$(basename $output).log ffmpeg -report -y -i "${input}" \
	-metadata creation_time="$(date -u -Is -r "${input}")" \
	-vaapi_device /dev/dri/renderD128 -movflags +faststart -vf 'format=nv12|vaapi,hwupload' -c:v h264_vaapi \
	-metadata creation_time="$(date -u -Ins -r "${input}")" \
	$rotate \
	-acodec aac "${output}" &> /dev/null
then
	rm -f "${output}"
	echo Error encoding "${input}", see /tmp/$(basename $output).log for details
	exit 1
fi

test "$format_duration" && printf "🎥 Duration: %.1f seconds\n" $format_duration 1>&2

function size {
	echo $(du -h "${1}" | tr '\n\t' ' ')
}

# Ensure creation time is the same
touch -r "${input}" "${output}"

readlink -f "${output}"
# Space savings https://en.wikipedia.org/wiki/Data_compression_ratio
printf "Space savings: %.0f%%\n" $(bc <<< "scale=2; (1 - $(wc -c < "${output}") / $(wc -c < "${input}") ) * 100") 1>&2

if test $overwrite -eq 1
then
	mv -v "${output}" "${input}"
fi
