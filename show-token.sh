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
echo "API Endpoint: http://localhost:8100/<your-mcp-server-name>"
echo "OpenAPI Spec: http://localhost:8100/<your-mcp-server-name>/openapi.json"
echo ""
echo "=============================================="