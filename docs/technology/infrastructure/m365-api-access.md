# Microsoft 365 Graph API Access

## Overview

This template documents app registration and API access patterns for read-only Microsoft Graph integrations.

## App Registration Template

- **App Name:** `<app-name>`
- **Client ID:** `<client-id>`
- **Tenant ID:** `<tenant-id>`
- **Service Principal ID:** `<service-principal-id>`
- **Tenant Domain:** `example.org`

## Permission Model

Document the minimal required application permissions and business justification for each permission.

## Secret and Certificate Handling

- Do not store secrets in repository content
- Use a managed secret store
- Prefer certificate credentials over long-lived client secrets when possible
- Define rotation cadence and owner

## Environment Variables (Template)

```bash
AZURE_TENANT_ID="<tenant-id>"
AZURE_CLIENT_ID="<client-id>"
AZURE_CLIENT_SECRET="<stored-in-secret-manager>"
```

## Example: Python MSAL Authentication

```python
from msal import ConfidentialClientApplication
import os

app = ConfidentialClientApplication(
    client_id=os.getenv("AZURE_CLIENT_ID"),
    client_credential=os.getenv("AZURE_CLIENT_SECRET"),
    authority=f"https://login.microsoftonline.com/{os.getenv('AZURE_TENANT_ID')}"
)

token = app.acquire_token_for_client(scopes=["https://graph.microsoft.com/.default"])
```

## Governance Requirements

- Permission review cadence
- Token/certificate lifecycle management
- API usage logging and anomaly detection
- Security review before scope expansion
