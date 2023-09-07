#!/bin/bash

# setup envs
source .env
APP_NAME=$(jq .program program.json)

echo "using endpoint: ${API_ENDPOINT}"
echo "app_name: ${APP_NAME}" 

# check latest height
latest_height=$(curl -sS "${API_ENDPOINT}"/testnet3/latest/height)
# find a latest token for deploying my leo program
snarkos developer scan \
    --private-key "${PRIVATE_KEY}" \
    --last 100 \
    --endpoint https://vm.aleo.org/api

echo "you need to set record with microcredits upper printed"