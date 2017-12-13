for i in *.fcpbundle
do
	source=$(basename $i)
	size=$(du -s $source | awk '{print $1}')
	if test $size == 0
	then
		rsync -av --delete $(mktemp -d)/ $source/ && rmdir $source/
	fi
done
