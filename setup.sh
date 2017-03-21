#!/bin/bash

VAULT_SERVER=10.0.2.4
export VAULT_ADDR=http://${VAULT_SERVER}:8200

vault init > /tmp/out

grep "Unseal Key" /tmp/out > keys
grep "Root Token" /tmp/out | awk -F': ' '{print $2}' > .root_token

# get vault config
declare -a keys
readarray -t keys < keys

token=$(cat .root_token)

echo $token
export VAULT_TOKEN=$token

vault unseal ${keys[0]/Unseal Key [1-5]: /}
vault unseal ${keys[1]/Unseal Key [1-5]: /}
vault unseal ${keys[2]/Unseal Key [1-5]: /}

vault policy-write secret/* policy.hcl
vault write secret/admin value=abcd1234
vault token-create -policy=secret/* | grep "token " | awk '{print $2}' > token

