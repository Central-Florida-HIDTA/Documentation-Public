# Microsoft Entra ID

## Overview

This document is a template for documenting Microsoft Entra ID configuration and governance in a production tenant.

## Tenant Profile

- **Primary Domain:** `example.org`
- **Default Domain:** `tenant.onmicrosoft.com`
- **License Baseline:** Document active SKU inventory and assignment model

## Identity Inventory (Template)

Document counts and categories only in public-facing documentation:

- Active users
- Guest users
- Service accounts
- Privileged access accounts
- Disabled accounts

For internal repositories, include the detailed account inventory and role mapping.

## Privileged Access Model

- Enforce dedicated privileged accounts
- Require phishing-resistant MFA for administrative roles
- Limit permanent Global Administrator assignments
- Review admin role assignments at least quarterly

## Lifecycle Controls

- Onboarding: account creation standards and baseline group assignment
- Changes: approval process for privilege and license changes
- Offboarding: disable, revoke sessions, transfer ownership, archive evidence

## Monitoring and Audit

- Sign-in risk monitoring
- Audit log review cadence
- Break-glass account validation
- Access review evidence retention

## Operational Validation Checklist

1. Verify privileged role assignments
2. Verify MFA coverage and exclusions
3. Verify inactive/disabled account controls
4. Verify conditional access alignment
5. Capture audit artifacts for compliance evidence
