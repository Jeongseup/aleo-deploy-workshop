#!/bin/env bash

# setup envs
source .env
APP_NAME=$(jq -r .program program.json)

echo "using endpoint: ${API_ENDPOINT}"
echo "app_name: ${APP_NAME}" 
echo "your record: ${RECORD}"

TOKEN="{
  owner: aleo1lvcpf354lkpme9fws3hzv28l5dh6fr8ge8r8wuaels8n7l7x2sqs44aq9z.private,
  balance: 100u32.private,
  _nonce: 5767395849959278014825296641296595201983113488064042486316403160592322215148group.public
}"

snarkos developer execute "${APPNAME}.aleo" "transfer" "aleo1ghcgkwwf56x4arevwn75kcddzevz7hhxrzc5ldqwdckkzzgkxc9sdjjxn0" "10u32" "${TOKEN}" \
    --private-key "${PRIVATEKEY}" \
    --query "https://vm.aleo.org/api" \
    --broadcast "https://vm.aleo.org/api/testnet3/transaction/broadcast" \
    --fee 1000000 \
    --record "${RECORD}"

    