# Exchange Online

## Overview

This document is a template for documenting Exchange Online architecture, policy controls, and operations.

## Service Profile

- **Primary Domain:** `example.org`
- **Tenant:** `tenant.onmicrosoft.com`
- **Environment:** Document service plan and compliance boundary

## Mailbox Model (Template)

Document mailbox categories in public documentation:

- User mailboxes
- Shared mailboxes
- Resource mailboxes
- Service mailboxes

Store mailbox inventories and routing details in internal repositories.

## Mail Flow and Protection

- Accepted domains and transport connectors
- Inbound/outbound anti-malware and anti-phishing controls
- Message tracing and escalation workflow
- External forwarding controls

## Retention and eDiscovery

- Retention policy baseline
- Litigation hold procedures
- eDiscovery case process and approvals
- Audit log retention targets

## Compliance Controls

- Encryption standards for data in transit and at rest
- DLP policies for sensitive data classes
- External sharing restrictions for regulated content
- Security incident response integration

## Operational Validation Checklist

1. Validate connector and domain configuration
2. Validate mailbox type governance
3. Validate DLP and encryption enforcement
4. Validate retention/eDiscovery settings
5. Validate audit and alerting coverage
