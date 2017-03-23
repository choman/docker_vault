#!/bin/bash

docker run -d --restart=always --cap-add=IPC_LOCK  \
           -e VAULT_ADDR=http://127.0.0.1:8200     \
           -v $(pwd)/config:/vault/config          \
           -v $(pwd)/data:/vault/file              \
           -p 8200:8200 --name vault vault server
