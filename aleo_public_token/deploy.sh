#!/bin/bash
args=("$@")

# setup envs
source .env
APP_NAME=$(jq -r .program program.json)

echo "using endpoint: ${API_ENDPOINT}"
echo "app_name: ${APP_NAME}" 
echo "your record: ${RECORD}"


# if records is empty , it needs to make a assert
snarkos developer deploy "${APP_NAME}" \
    --private-key "${PRIVATE_KEY}" \
    --query "${API_ENDPOINT}" \
    --path "./build/" \
    --broadcast "${API_ENDPOINT}/testnet3/transaction/broadcast" \
    --fee 1000000 \
    --record "${RECORD}"

# after deploying, wee need to scan again to find out my last utxo
echo "after deploying, wee need to scan again to find out my last utxo"
bash scan.sh

echo "change your record with last one in .env"