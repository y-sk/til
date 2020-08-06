#!/bin/sh

docker run \
  -e "AWS_ACCESS_KEY_ID=local" \
  -e "AWS_SECRET_ACCESS_KEY=local" \
  -e "AWS_DEFAULT_REGION=us-west-2" \
  -e "AWS_DEFAULT_OUTPUT=json" \
  --rm \
  -it amazon/aws-cli dynamodb create-table \
    --table-name test \
    --attribute-definitions AttributeName=Id,AttributeType=N \
    --key-schema AttributeName=Id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
    --endpoint-url http://192.168.33.10:8000
