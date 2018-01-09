#!/bin/bash
# AWS Connection
aws_password=$1
aws_vpc_id=$2
conn="{\"id\": \"\", \"alias\": \"AWS-Cred\",\"authType\": \"basicCredentials\",\"regionName\": \"us-east-1\",\"vpcId\": $2,\"availabilityZone\": \"us-east-1a\",\"accessKey\": \"AKIAJHTUIWCEVO7WZM4A\",\"secretKey\": \"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\"}"
curl  --insecure  -X POST https://localhost/api/v1.3/vfm/aws/connections  -u admin:$1  -d "$conn" --header "Content-Type:application/json"
