FROM ghcr.io/open-webui/mcpo:main

# Install openssl for token generation
USER root
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# Copy configuration and startup script
COPY config.json /config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod 644 /config.json && chmod +x /entrypoint.sh

# Stay as root to run the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
