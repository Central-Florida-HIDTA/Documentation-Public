# Governance Documentation Template

Public template for policy, compliance, and platform documentation.

## Purpose

Use this repository as a baseline for:

- Governance policies and standards
- Operational SOPs
- Technology platform documentation
- Compliance control mapping and audit readiness

## Repository Structure

### [docs/policies/](docs/policies/)

Governance, compliance, and operations policies.

- **[cjis/](docs/policies/cjis/)** - CJIS-aligned policy templates
- **[isc/](docs/policies/isc/)** - Analyst and operations procedure templates
- **[it/](docs/policies/it/)** - IT governance and change-management templates

### [docs/technology/](docs/technology/)

Technical system and platform documentation templates.

- **[systems/](docs/technology/systems/)** - Application and system-level documentation
- **[infrastructure/](docs/technology/infrastructure/)** - Identity, messaging, collaboration, and security platform docs

### [docs/resources/](docs/resources/)

Index-only folder for references that are intentionally not stored in upstream.

## Public/Private Split Model

Recommended model:

1. Keep this repo public as your generic baseline.
2. Fork into your organization for branding and org-specific customization.
3. Store binary artifacts and sensitive operational records in a separate private repo.

## Recommended Compliance Frameworks

- FBI CJIS Security Policy
- NIST Cybersecurity Framework
- NIST SP 800-53
- Organization-specific regulatory requirements

## Contributing

When adding or updating policy documents, include:

- Version
- Effective date
- Next review date
- Document owner role

## License

Apache-2.0
