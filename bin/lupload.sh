#!/bin/sh
for i in "$@"
do
	test -e "$i" || exit
	test -d /Volumes/raid1/kai || exit
	ddir="/Volumes/raid1/kai/$(date +%Y-%m-%d)"
	test -d $ddir || mkdir $ddir
	mv $i $ddir
done
