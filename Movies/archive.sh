#!/bin/bash
for bundle in *.fcpbundle
do
	test $bundle/Settings.plist || exit
	name=$(basename $bundle .fcpbundle)
	if test -e $name.tar
	then
		echo $name.tar already exists
		exit 1
	fi
	if tar -cv --exclude "*Render Files*" --exclude "*Analysis Files*" -f $name.tar $bundle
	then
		test -e $name.tar && rm -rf $bundle
	fi
done
