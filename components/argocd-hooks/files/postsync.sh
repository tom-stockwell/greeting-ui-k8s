#!/bin/bash

set -eux

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
TEMPLATE_FILE="$SCRIPT_DIR/webhook-template.json"

curl -sX POST \
  -H "Content-Type: application/json" \
  -H "X-ArgoCD-Hook: $HOOK" \
  -d "$(envsubst < "$TEMPLATE_FILE")" \
  "$WEBHOOK_URL"
