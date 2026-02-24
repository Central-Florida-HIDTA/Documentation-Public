# Microsoft 365 Licensing

## Overview

Central Florida HIDTA's Microsoft 365 subscription licensing inventory and consumption tracking.

**Tenant:** example.org  
**Tenant ID:** `9a6b75a5-cecf-400f-ac7b-10661ef878f4`  
**Last Updated:** January 28, 2026

## License Summary

| License Name | SKU | Total | Assigned | Available | Status |
| ------------------------------- | --------------------------- | ----- | -------- | --------- | ---------------- |
| Microsoft 365 G3 GCC | M365_G3_GOV | 25 | 24 | 1 | Active |
| Teams Essentials GCC | MCOTEAMS_ESSENTIALS_GOV | 20 | 20 | 0 | Suspended (20) |
| Audio Conferencing GCC | MCOMEETADV_GOV | 25 | 24 | 1 | Active |
| Phone System Virtual User GCC | PHONESYSTEM_VIRTUALUSER_GOV | 25 | 3 | 22 | Suspended (25) |
| Rights Management Service Basic | RMSBASIC | 1 | 0 | 1 | Active |
| Office 365 E3 GCC | ENTERPRISEPACK_GOV | 25 | 0 | 0 | Suspended (25) |

**Total User Licenses:** 121 (across all SKUs)  
**Total Assigned:** 71 licenses  
**Utilization Rate:** 58.7%

## Active Licenses

### Microsoft 365 G3 GCC (Primary)

**SKU ID:** `e823ca47-49c4-46b3-b38d-ca11d5abe3d2`  
**SKU Part Number:** `M365_G3_GOV`  
**Status:** Enabled

- **Total Licenses:** 25
- **Assigned:** 24
- **Available:** 1
- **Consumption:** 96%

**Included Service Plans:**

- Exchange Online (Plan 2) GCC
- SharePoint Online (Plan 2) GCC
- Office 365 ProPlus GCC
- Microsoft Teams GCC
- OneDrive for Business (Plan 2)
- Azure Active Directory Premium P1
- Microsoft Intune
- Microsoft Information Protection & Governance
- Power Apps for Office 365 GCC
- Power Automate for Office 365 GCC
- Microsoft Stream for Office 365 GCC
- Microsoft Forms GCC
- Microsoft Planner
- Microsoft To Do
- Whiteboard
- Microsoft Search
- MyAnalytics GCC
- Microsoft Bookings
- Project for Office 365 GCC
- Microsoft Defender for Endpoint (Lite)
- Content Explorer & Classification
- Multi-Factor Authentication
- Azure Rights Management
- Universal Print GCC (Pending Provisioning)

### Audio Conferencing GCC

**SKU ID:** `2d3091c7-0712-488b-b3d8-6b97bde6a1f5`  
**SKU Part Number:** `MCOMEETADV_GOV`  
**Status:** Enabled

- **Total Licenses:** 25
- **Assigned:** 24
- **Available:** 1
- **Consumption:** 96%

**Included Service Plans:**

- Microsoft Teams Audio Conferencing GCC
- Exchange Online Foundation GCC

### Phone System Virtual User GCC

**SKU ID:** `2cf22bcb-0c9e-4bc6-8daf-7e7654c0f285`  
**SKU Part Number:** `PHONESYSTEM_VIRTUALUSER_GOV`  
**Status:** Enabled (25 suspended)

- **Total Licenses:** 25
- **Assigned:** 3
- **Available:** 22
- **Suspended:** 25
- **Consumption:** 12%

**Included Service Plans:**

- Teams Phone Virtual User GCC

**Note:** These licenses are for auto-attendants and call queues, not individual users.

### Rights Management Service Basic

**SKU ID:** `093e8d14-a334-43d9-93e3-30589a8b47d0`  
**SKU Part Number:** `RMSBASIC`  
**Status:** Enabled (Company-level)

- **Total Licenses:** 1
- **Assigned:** 0
- **Type:** Company-wide service

**Included Service Plans:**

- Exchange Online Foundation
- Azure Rights Management Services Basic

## Suspended/Inactive Licenses

### Teams Essentials GCC

**SKU ID:** `496559b3-b271-4ccd-ad4e-726473a55ac9`  
**SKU Part Number:** `MCOTEAMS_ESSENTIALS_GOV`  
**Status:** Enabled (20 suspended)

- **Total Licenses:** 20
- **Assigned:** 20
- **Suspended:** 20
- **Consumption:** 100% (suspended)

**Included Service Plans:**

- Microsoft Teams Calling Plans (Domestic) GCC
- Teams Phone Standard GCC
- Exchange Online Foundation GCC

**Recommendation:** Review suspension status and either activate or cancel subscription.

### Office 365 E3 GCC

**SKU ID:** `535a3a29-c5f0-42fe-8215-d3b9e1f38c4a`  
**SKU Part Number:** `ENTERPRISEPACK_GOV`  
**Status:** Suspended

- **Total Licenses:** 25
- **Assigned:** 0
- **Suspended:** 25
- **Consumption:** 0%

**Note:** This SKU appears to be a legacy subscription replaced by Microsoft 365 G3 GCC. Consider canceling if no longer needed.

## License Optimization Recommendations

### 1. Review Suspended Subscriptions

- **Teams Essentials GCC:** 20 licenses suspended but marked as consumed
- **Office 365 E3 GCC:** 25 licenses suspended with zero consumption
- **Phone System Virtual User:** 25 suspended, only 3 in use

**Action:** Contact Microsoft licensing to reconcile suspended subscriptions and potentially reduce costs.

### 2. Capacity Planning

Current M365 G3 utilization: **24 of 25 licenses (96%)**

- **Immediate capacity:** 1 additional user
- **Recommended buffer:** 10-15% (2-4 licenses)
- **Action:** Consider purchasing 5 additional M365 G3 licenses for growth

### 3. Optimize Phone System Licensing

Only 3 of 25 Phone System Virtual User licenses are assigned:

- **Action:** Review call queue/auto-attendant requirements
- If <25 virtual users needed, reduce license count
- Potential savings: ~$88/month ($4/license × 22 unused)

### 4. Consolidate Duplicate Services

Office 365 E3 GCC is fully suspended while M365 G3 is active:

- **Action:** Cancel E3 subscription to avoid duplicate costs
- Ensure all users migrated to M365 G3
- Potential savings: Subscription cost for 25 E3 licenses

## Cost Analysis

**Estimated Monthly Costs** (based on Government pricing):

| License | Quantity | Est. Unit Cost | Monthly Cost |
| ------------------------ | ---------------- | -------------- | ---------------- |
| M365 G3 GCC | 25 | $33.00 | $825.00 |
| Audio Conferencing GCC | 25 | $8.00 | $200.00 |
| Phone System Virtual User | 25 | $4.00 | $100.00 |
| Teams Essentials GCC | 20 (suspended) | $12.00 | $240.00 |
| Office 365 E3 GCC | 25 (suspended) | $20.00 | $500.00 |
| **Total** | **120** | | **$1,865.00/mo** |

**Potential savings with optimization:** ~$600-800/month

## License Assignment Policy

### Standard User Profile

- Microsoft 365 G3 GCC
- Audio Conferencing GCC (if needed for meetings)

### Administrator Profile

- Microsoft 365 G3 GCC (includes AAD Premium P1)
- Audio Conferencing GCC

### Service Accounts

- Phone System Virtual User GCC (auto-attendants/call queues only)

## Compliance Considerations

### GCC (Government Community Cloud)

All active licenses are **GCC-compliant** for law enforcement use:

- CJIS compliance certified
- Data residency in US government datacenters
- Enhanced security and compliance controls
- FBI CJIS Security Policy alignment

### Service Plans Status

**Provisioning Issues:**

- Universal Print GCC: PendingProvisioning on M365 G3
- Intune for Office 365: PendingActivation on suspended E3

**Action:** Monitor provisioning status and verify services are operational.

## Management

### License Assignment

**Via Azure Portal:**

```bash
# Assign M365 G3 to user
az rest --method POST \
  --url "https://graph.microsoft.com/v1.0/users/{user-id}/assignLicense" \
  --body '{"addLicenses":[{"skuId":"e823ca47-49c4-46b3-b38d-ca11d5abe3d2"}],"removeLicenses":[]}'
```

**Via PowerShell:**

```powershell
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Assign license
Set-MgUserLicense -UserId "user@example.org" `
  -AddLicenses @{SkuId = "e823ca47-49c4-46b3-b38d-ca11d5abe3d2"} `
  -RemoveLicenses @()
```

### License Reporting

```bash
# Get all licensed users
az rest --method GET \
  --url 'https://graph.microsoft.com/v1.0/users?$select=displayName,userPrincipalName,assignedLicenses'

# Export to CSV
az rest --method GET \
  --url 'https://graph.microsoft.com/v1.0/users?$select=displayName,userPrincipalName,assignedLicenses' \
  | jq -r '.value[] | [.displayName, .userPrincipalName, (.assignedLicenses | length)] | @csv'
```

## Support & Resources

**Licensing Questions:**

- **Microsoft Volume Licensing:** 1-<support-phone>
- **GCC Support:** [Microsoft 365 Government Support](https://www.microsoft.com/microsoft-365/government)

**Internal Contacts:**

- **Financial Manager:** Finance Owner (<finance-owner-email>)
- **IT Administrator:** Platform Owner (<platform-owner-email>)
- **ISC Manager:** Role Owner (<role-owner-email>)

**Resources:**

- [Microsoft 365 GCC Service Descriptions](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc)
- [GCC High and DoD Service Descriptions](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-us-government/gcc-high-and-dod)
- [Microsoft Graph Licensing API Reference](https://learn.microsoft.com/en-us/graph/api/resources/subscribedsku)

## Change Log

| Date | Change | By |
| ---------- | ------------------------------------ | ------------- |
| 2026-01-28 | Initial documentation from Graph API | Platform Owner |

---

**Next Review:** February 2026 (monthly license audit)  
**Data Source:** Microsoft Graph API (`/subscribedSkus` endpoint)
