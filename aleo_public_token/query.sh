#!/bin/bash

# setup envs
args=("$@")
source .env
APP_NAME=$(jq -r .program program.json)

echo "Equivalent snarkOS API: /testnet3/program/{programID}/mapping/{mappingName}/{mappingKey}"
echo "using endpoint: ${API_ENDPOINT}"
echo "app_name: ${APP_NAME}" 
# echo "your record: $RECORD"
# echo "your execute function: ${args[0]}"

echo "found your token mapped"
curl -sS "${API_ENDPOINT}/testnet3/program/${APP_NAME}/mapping/account/aleo1lvcpf354lkpme9fws3hzv28l5dh6fr8ge8r8wuaels8n7l7x2sqs44aq9z"