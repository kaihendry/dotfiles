#!/bin/bash
today=/tmp/inventory-$(date --rfc-3339=date).csv.gz

test "$1" || exit

if ! test -f $today
then
	# https://stackoverflow.com/a/63205344/4534
	aws --profile mine s3 cp s3://s.natalian.org-inventory/$(aws --profile mine s3api list-objects --bucket s.natalian.org-inventory --prefix s.natalian.org/index/data/ --query 'sort_by(Contents, &LastModified)[-1].Key' --output text) $today
fi

# "s.natalian.org","2020-07-28/foobar.jpeg","110819","2020-07-28T23:52:31.000Z"
zgrep $1 $today | tr -d '"' | while IFS=, read -r site path size date etag
do
	echo https://$site/$path $etag
done
