# Evidence Index

**Version:** 0.1
**Status:** Draft
**Owner Role:** Compliance Operations Lead
**Last Updated:** YYYY-MM-DD
**Next Review:** YYYY-MM-DD

## Purpose

Track where evidence is stored for each control without storing the evidence itself in this public repository.

## Evidence Location Guidance

Store evidence in private repositories or approved internal evidence systems.

Use stable references so auditors can trace control implementation to proof.

## Evidence Register

| Control Ref | Evidence Description | System Source | Private Location Ref | Collection Frequency | Owner Role | Last Reviewed |
| ----------- | -------------------- | ------------- | -------------------- | -------------------- | ---------- | ------------- |
| AC-2 | Account inventory and lifecycle evidence | Identity platform | `<private-repo-or-system-path>` | Monthly | TBD | YYYY-MM-DD |
| AU-2 | Audit logging configuration and sample export | Logging platform | `<private-repo-or-system-path>` | Quarterly | TBD | YYYY-MM-DD |
| IR-4 | Incident response test and after-action evidence | IR program | `<private-repo-or-system-path>` | Quarterly | TBD | YYYY-MM-DD |

## Naming Recommendations

- Use control IDs in evidence artifact names where practical.
- Include collection date in `YYYY-MM-DD` format.
- Keep evidence references immutable once used for an audit period.
