#!/bin/bash
set -e

# Define the path for the token
TOKEN_PATH="/run/secrets/mcpo_bearer_token"

# Generate a random Bearer token if not provided
if [ -z "$MCPO_BEARER_TOKEN" ]; then
    MCPO_BEARER_TOKEN=$(openssl rand -hex 32)
fi

# Save the token for other services to use
echo -n "$MCPO_BEARER_TOKEN" > "$TOKEN_PATH"
chmod 644 "$TOKEN_PATH"

echo "=============================================="
echo "🔐 MCPO Bearer Token Generated"
echo "=============================================="
echo "Token has been saved to ./.mcpo/mcpo_bearer_token"
echo "Use './show-token.sh' to display it."
echo "=============================================="
echo ""

# Start mcpo with the generated token
exec mcpo "$@" --api-key "$MCPO_BEARER_TOKEN"