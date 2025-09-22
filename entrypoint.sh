#!/bin/bash

# Generate a random Bearer token if not provided
if [ -z "$MCPO_BEARER_TOKEN" ]; then
    MCPO_BEARER_TOKEN=$(openssl rand -hex 32)
fi

echo "=============================================="
echo "🔐 MCPO Bearer Token Generated"
echo "=============================================="
echo ""
echo "Use this Bearer token in OpenWebUI:"
echo ""
echo "Bearer $MCPO_BEARER_TOKEN"
echo ""
echo "OpenWebUI Configuration:"
echo "- URL: http://192.168.1.200:8100/armis-security"
echo "- Auth Type: Bearer"
echo "- Token: $MCPO_BEARER_TOKEN"
echo ""
echo "=============================================="
echo ""

# Start mcpo with the generated token
exec mcpo "$@" --api-key "$MCPO_BEARER_TOKEN"
