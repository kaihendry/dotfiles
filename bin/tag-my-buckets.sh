buckets=$(aws s3api list-buckets --query "Buckets[].Name" | jq -r '.[]')
for bucket in $buckets
do
  echo $bucket
  case "$bucket" in
    *)
	  echo Tagging $bucket
      aws s3api put-bucket-tagging --bucket $bucket --tagging 'TagSet=[{Key=hendry-bucket-name,Value='$bucket'}]'
      ;;
  esac
done
