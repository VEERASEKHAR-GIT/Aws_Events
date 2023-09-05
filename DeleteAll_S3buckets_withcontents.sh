#!/bin/bash

# List all buckets and their names
aws s3 ls | awk '{print $3}' > bucket_list.txt

# Iterate through the bucket list and delete each bucket and its contents
while read -r bucket; do
    echo "Deleting bucket: $bucket"
    aws s3 rb s3://$bucket --force
done < bucket_list.txt

# Clean up the temporary file
rm bucket_list.txt
