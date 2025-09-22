# MCP-to-OpenAPI Proxy

A Dockerized proxy to expose any MCP (Master Control Program) server as a standard OpenAPI interface, enabling integration with LLMs and other developer tools.

This project is powered by [mcpo](https://github.com/open-webui/mcpo) and secured with Bearer token authentication.

This proxy allows Large Language Models (LLMs) and other developer tools to interact with OpenAPI-compliant endpoints, enabling a wide range of automation and integration possibilities.

## Why Use This Proxy?

- **Compatibility**: Makes non-standard MCP APIs compatible with the vast ecosystem of OpenAPI tools, such as code generators, testing frameworks, and API explorers.
- **LLM Integration**: Enables LLMs to understand and interact with your APIs for tasks like automated testing, data retrieval, and complex workflow execution. An example of this is with [OpenWebUI](https://github.com/open-webui/open-webui), which can use this proxy to give its LLMs tools to interact with the real world.
- **Simplified Authentication**: Abstracts complex authentication mechanisms behind a simple, unified Bearer token, simplifying client-side code.
- **Standardization**: Presents a consistent, predictable API interface, regardless of the underlying MCP implementation.

## Features

- **OpenAPI Transformation**: Converts an MCP into a standard OpenAPI specification.
- **Secure Authentication**: Automatically generates a secure Bearer token on startup.
- **Dockerized**: Easy to deploy and manage with Docker Compose.
- **Customizable**: Supports custom Bearer tokens and flexible configuration.

## Prerequisites

- Docker and Docker Compose
- Access to an MCP server with API credentials

## Quick Start

1.  **Configure API Access**:
    Copy the `template.config.json` to `config.json`:
    ```bash
    cp template.config.json config.json
    ```
    Edit `config.json` to point to your MCP server and include the necessary authentication headers. See `example.config.json` for an Armis integration example.

2.  **Start the Proxy Service**:
    ```bash
    docker compose up -d
    ```

3.  **Retrieve the Bearer Token**:
    The authentication token is saved in the `./.mcpo` directory. To view it, run:
    ```bash
    ./show-token.sh
    ```

## Usage

- **API Endpoint**: `http://localhost:8100/<your-mcp-server-name>`
- **OpenAPI Docs**: `http://localhost:8100/docs`

Use the API endpoint and the generated Bearer token to interact with your MCP server.

## Security

- **API Key**: The `config.json` file contains your API key and is ignored by Git. Keep this file secure.
- **Bearer Token**: A new, secure token is generated each time the container starts and stored in the `./.mcpo` directory. For production, consider using a long-lived token by setting `MCPO_BEARER_TOKEN` in `docker-compose.yml`.
- **Network**: The service is exposed on `0.0.0.0:8100`. For production, restrict access to trusted IPs or place it behind a reverse proxy with TLS.

## Development

- **View Logs**: `docker logs mcpo-proxy`
- **Restart Service**: `docker compose restart` (generates a new token)
- **Stop Service**: `docker compose down`