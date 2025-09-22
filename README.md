# Armis MCP to OpenAPI Proxy

This project provides a Docker-based proxy to expose the Armis Security MCP (Master Control Program) server as a standard OpenAPI interface, secured with Bearer token authentication. It is designed for seamless integration with tools like OpenWebUI.

## Features

- **OpenAPI Transformation**: Converts the Armis MCP into a standard OpenAPI specification.
- **Secure Authentication**: Automatically generates a secure Bearer token on startup.
- **Dockerized**: Easy to deploy and manage with Docker Compose.
- **Customizable**: Supports custom Bearer tokens and flexible configuration.

## Prerequisites

- Docker and Docker Compose
- Access to an Armis Security instance with API credentials

## Quick Start

1.  **Configure Armis API Access**:
    ```bash
    cp config.json.template config.json
    ```
    Edit `config.json` and replace `YOUR_ARMIS_API_KEY` with your actual Armis API key.

2.  **Start the Proxy Service**:
    ```bash
    docker compose up -d
    ```

3.  **Retrieve the Bearer Token**:
    The authentication token is logged to the console on startup. To view it at any time, run:
    ```bash
    ./show-token.sh
    ```

## Usage

- **API Endpoint**: `http://<host-ip>:8100/armis-security`
- **OpenAPI Docs**: `http://localhost:8100/docs`

To integrate with a client like OpenWebUI, use the API endpoint and the generated Bearer token for authentication.

## Security

- **API Key**: The `config.json` file contains your Armis API key and should be treated as a secret. It is ignored by Git.
- **Bearer Token**: A new, secure token is generated each time the container starts. For production environments, consider using a long-lived, managed token by setting `MCPO_BEARER_TOKEN` in `docker-compose.yml`.
- **Network**: The service is exposed on `0.0.0.0:8100`. For production, restrict access to trusted IPs or place it behind a reverse proxy with TLS.

## Development

- **View Logs**: `docker logs mcpo-armis`
- **Restart Service**: `docker compose restart` (generates a new token)
- **Stop Service**: `docker compose down`