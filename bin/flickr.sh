#!/bin/bash -e

tmp=$(mktemp)
trap "rm -f $tmp" EXIT

upload () {
	photoid=$(flickcurl -V upload $1 description $1 friend | grep "Photo ID" | awk '{print $NF}')
	if test "$photoid" -eq "$photoid"
	then
		echo Uploaded $1 as $photoid
		echo "$photoid" > ${1}.uploaded
	else
		echo $1 failed to upload
	fi
}

uploadloop(){

	c=0
	while read f
	do
		test -f $f && c=$((c + 1))
	done < $1

	test $c -eq 0 && exit 0
	read -p "Are you sure to upload $c files?" -n 1 -r </dev/tty
	echo    # (optional) move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		exit 1
	fi

	n=1
	while read uploadme
	do
		test -f $uploadme || continue
		echo -n "$n/$c: "
		upload $uploadme
		n=$(( n+1 ))
	done < $1
}

count=0

find $@ -type f -iname '*.jpg' | sort | while read jpg
do
	if ! test -f "${jpg}.uploaded"
	then
		echo $jpg >> $tmp
		count=$((count + 1))
	else
		#echo Already uploaded: $jpg
		continue
	fi

done

cat $tmp
uploadloop $tmp
