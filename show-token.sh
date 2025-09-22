#!/bin/bash

TOKEN_PATH="./.mcpo/mcpo_bearer_token"

if [ ! -f "$TOKEN_PATH" ]; then
    echo "Token file not found. Is the service running?" >&2
    exit 1
fi

TOKEN=$(cat "$TOKEN_PATH")

echo "=============================================="
echo "🔐 Current MCPO Bearer Token"
echo "=============================================="
echo ""
echo "Bearer Token: $TOKEN"
echo ""
echo "API Endpoint: http://localhost:8100/armis-security"
echo "OpenAPI Spec: http://localhost:8100/armis-security/openapi.json"
echo ""
echo "=============================================="