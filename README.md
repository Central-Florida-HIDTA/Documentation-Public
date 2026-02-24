# Central Florida HIDTA Documentation (Public)

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Public-facing governance and technology documentation baseline for Central Florida HIDTA.

## Upstream

This repository is a branded fork of:

- `joshphillipssr/governance-documentation-template`

## Why This Repo Exists

Most teams have policies in one place, technical runbooks in another, and compliance evidence somewhere else.
This repository provides a public-safe, structured baseline for governance and platform documentation.

## What You Get

- Policy and SOP templates organized by function
- Infrastructure and system documentation templates
- Compliance framework scaffolding (NIST CSF, FISMA Moderate mapping)
- A clean public/private boundary model for downstream operations

## Repository Layout

- [`docs/policies/`](docs/policies/)
- [`docs/policies/cjis/`](docs/policies/cjis/)
- [`docs/policies/isc/`](docs/policies/isc/)
- [`docs/policies/it/`](docs/policies/it/)
- [`docs/policies/compliance/`](docs/policies/compliance/)
- [`docs/technology/`](docs/technology/)
- [`docs/technology/infrastructure/`](docs/technology/infrastructure/)
- [`docs/technology/systems/`](docs/technology/systems/)
- [`docs/resources/`](docs/resources/)

## Who This Is For

- Security and compliance teams
- IT leadership and platform owners
- Public-sector and regulated environments
- Teams standardizing documentation across public and private repos

## Quick Start

1. Fork this repository.
2. Replace placeholder values with organization-specific content.
3. Keep sensitive artifacts (inventory exports, evidence, binary docs) in a private companion repository.
4. Use pull requests for policy/version updates.

## Public/Private Boundary

This repository intentionally excludes binary artifacts and internal operational evidence.

Internal-only resource artifacts are stored in:

- `Central-Florida-HIDTA/Documentation-Resources-Internal`

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Security

See [`SECURITY.md`](SECURITY.md).

## License

Apache-2.0
