for i in *.fcpbundle
do
	echo $i
	( cd $i && du -sh *)
done
