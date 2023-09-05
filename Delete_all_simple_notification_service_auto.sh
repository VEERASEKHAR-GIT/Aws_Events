# List all SNS topics and extract their ARNs
topic_arns=$(aws sns list-topics --query 'Topics[*].TopicArn' --output json | jq -r '.[]')

# Loop through each topic ARN and delete the corresponding SNS topic
for topic_arn in $topic_arns; do
    echo "Deleting SNS topic: $topic_arn"
    aws sns delete-topic --topic-arn "$topic_arn"
done
