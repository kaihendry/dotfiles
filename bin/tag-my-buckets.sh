# https://s.natalian.org/2020-06-09/1591697378_2560x1440.png
# TODO improve with https://stackoverflow.com/a/63017991/4534
buckets=$(aws s3api list-buckets --query "Buckets[].Name" | jq -r '.[]')
for bucket in $buckets
do
  case "$bucket" in
    *)
	  echo Tagging $bucket
	  # if ! aws s3api put-bucket-tagging --bucket $bucket --tagging 'TagSet=[{Key=hendry-bucket-name,Value='$bucket'}]'
	  # then
		#  echo Failed to put-bucket-tagging
	  # fi
	  if ! aws resourcegroupstaggingapi tag-resources --resource-arn-list arn:aws:s3:::$bucket --tags hendry-bucket-name=$bucket
	  then
		  echo Failed to resourcegroupstaggingapi
	  fi
      ;;
  esac
done
