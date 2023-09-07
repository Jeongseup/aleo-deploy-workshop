#!/bin/env bash

# setup envs
source .env
APP_NAME=$(jq -r .program program.json)

echo "using endpoint: ${API_ENDPOINT}"
echo "app_name: ${APP_NAME}" 
echo "your record: ${RECORD}"


cd .. && snarkos developer deploy "${APPNAME}.aleo" --private-key "${PRIVATEKEY}" --query "https://vm.aleo.org/api" --path "./${APPNAME}/build/" --broadcast "https://vm.aleo.org/api/testnet3/transaction/broadcast" --fee 1000000 --record "${RECORD}"``


