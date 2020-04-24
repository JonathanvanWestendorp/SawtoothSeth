#!/bin/bash

## run docker exec -it seth-cli-go bash deploy.sh to make account and add contract

openssl ecparam -genkey -name secp256k1 | openssl ec -out key-file.pem -aes128
seth account import key-file.pem jona
seth account create --nonce=0 --wait myalias
