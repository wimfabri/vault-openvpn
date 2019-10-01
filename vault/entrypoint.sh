#!/bin/bash

set -e

export VAULT_ADDR=${VAULT_ADDR:-https://vault.service.consul:8200}
export VAULT_CACERT=${VAULT_CACERT:-/opt/vault/ca.crt}

/go/bin/vault-openvpn $@

