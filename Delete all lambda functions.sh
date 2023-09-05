#!/bin/bash

# List all Lambda functions and extract their names using AWS CLI and jq
function_names=$(aws lambda list-functions --query 'Functions[].FunctionName' --output json | jq -r '.[]')

# Loop through each function name and delete the corresponding Lambda function
for function_name in $function_names; do
    echo "Deleting Lambda function: $function_name"
    
    # Delete the Lambda function using AWS CLI
    aws lambda delete-function --function-name "$function_name"
done
