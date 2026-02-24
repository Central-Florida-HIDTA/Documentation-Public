# Compliance Frameworks

## Purpose

This folder is the canonical home for organization-wide security control frameworks and control mappings.

Use this folder for:

- NIST Cybersecurity Framework (CSF) profile documentation
- FISMA Moderate impact control baseline documentation
- Crosswalks between framework outcomes and controls
- Plan of Action and Milestones (POA&M) tracking
- Evidence indexing metadata (not evidence artifacts)

## Public and Private Boundary

This public upstream should contain framework structure, control language templates, and mapping logic.

Do not store sensitive evidence in this repository.

Store evidence artifacts in a private companion repository and reference them from `evidence-index.md`.

## Files

- `nist-csf-profile.md`
- `fisma-moderate-baseline.md`
- `csf-to-800-53-crosswalk.md`
- `poam.md`
- `evidence-index.md`

## Operating Model

1. Define expected outcomes in `nist-csf-profile.md`.
2. Track control-level implementation in `fisma-moderate-baseline.md`.
3. Maintain mapping logic in `csf-to-800-53-crosswalk.md`.
4. Track gaps and remediation in `poam.md`.
5. Track where evidence lives in `evidence-index.md`.

## Review Cadence

Recommended cadence:

- Monthly POA&M review
- Quarterly control baseline review
- Annual framework profile refresh
