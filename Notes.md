- Fixes to docker-entry and Dockerfile
- run.sh
- docker-compose

- set VAULT_ADDR
- vault init
- capture keys and token


- may need to unseal to write policy
- vault policy-write <name> <file>


- create token with policy
- vault token-create -policy <name>

- copy all to client - less root token

Now client should be able to unseal vault using keys 
and access data using token


-----[start here]-------

./run.sh
set VAULT_ADDR
vault init
capture keys and token (send to baseimahe)

vault unseal *#
set VAULT_TOKEN
vault policy-write secret/* policy.hcl


# set admin  password

vault write secret/admin value=abcd1234
vault token-create -policy=secret/*

- copy all to client - less root token

Now client should be able to unseal vault using keys 
and access data using token
