#!/bin/sh

docker run \
  -e "AWS_ACCESS_KEY_ID=local" \
  -e "AWS_SECRET_ACCESS_KEY=local" \
  -e "AWS_DEFAULT_REGION=us-west-2" \
  -e "AWS_DEFAULT_OUTPUT=json" \
  -v "$PWD":/tmp/data \
  --rm \
  -it amazon/aws-cli dynamodb batch-write-item \
    --request-items file:///tmp/data/03.json \
    --endpoint-url http://192.168.33.10:8000
