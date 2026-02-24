# CSF to NIST SP 800-53 Crosswalk

**Version:** 0.1
**Status:** Draft
**Owner Role:** Security Architect
**Last Updated:** YYYY-MM-DD
**Next Review:** YYYY-MM-DD

## Purpose

Map NIST CSF outcomes to NIST SP 800-53 control families used for FISMA Moderate.

## Crosswalk Table

| CSF Function | Example Outcome Area | 800-53 Families (Primary) | Baseline Reference |
| ------------ | -------------------- | ------------------------- | ------------------ |
| Govern       | Policy, oversight, risk governance | PL, PM, RA, CA | `fisma-moderate-baseline.md` |
| Identify     | Asset and risk understanding | CM, RA, PM | `fisma-moderate-baseline.md` |
| Protect      | Access and data protection controls | AC, IA, SC, MP, CM | `fisma-moderate-baseline.md` |
| Detect       | Monitoring and detection capability | AU, SI, CA, IR | `fisma-moderate-baseline.md` |
| Respond      | Incident response execution | IR, CP, AU, PL | `fisma-moderate-baseline.md` |
| Recover      | Service restoration and improvement | CP, IR, PL, CA | `fisma-moderate-baseline.md` |

## Usage Guidance

- Use this document to drive framework alignment discussions.
- Use `fisma-moderate-baseline.md` for control-level status.
- Use `poam.md` to track gaps where mapping exists but implementation is incomplete.

## Tailoring Notes

Document any organization-specific tailoring decisions here.
