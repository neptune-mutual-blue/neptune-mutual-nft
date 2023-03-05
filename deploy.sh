#!/usr/bin/env bash

[ ! -f .env ] || export $(grep -v '^#' .env | xargs)

echo $ETHERSCAN_API_KEY

forge create --rpc-url $RPC \
  --constructor-args $ACCOUNT $ACCOUNT $BASE_URI \
  --private-key $PRIVATE_KEY src/NeptuneMutualNft.sol:NeptuneMutualNft \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  --verify
