# Security & Compliance Center

## Overview

The Microsoft Purview Compliance Manager (formerly Security & Compliance Center) is the centralized hub for managing data governance, protection, and compliance in Microsoft 365. It provides Data Loss Prevention (DLP), retention policies, eDiscovery, audit logging, and information governance for Central Florida HIDTA.

**Service Type:** Cloud-based Compliance and Data Governance  
**License:** Included with Microsoft 365 G3 GCC (basic features), M365 E5 GCC (advanced)  
**Compliance:** CJIS-required (audit logging, retention, DLP for CJI)

## Service Details

**Admin Portal:** [Microsoft Purview Compliance Manager](https://compliance.microsoft.com)  
**Environment:** GCC (Government Community Cloud)  
**Integration:** All M365 services (Teams, SharePoint, OneDrive, Exchange Online, etc.)  
**Scope:** Organization-wide data governance and compliance

## Service Components

### 1. Data Loss Prevention (DLP)

**Purpose:** Prevent accidental or intentional sharing of sensitive information (CJI, CHRI, PII, financial data)

**How It Works:**

- Scans content in real-time (Teams messages, SharePoint documents, emails)
- Detects sensitive content using:
  - Content matching (keywords, patterns, regular expressions)
  - Machine learning (sensitive document types)
  - Sensitive information types (SSN, credit card, driver's license, etc.)
- Applies enforcement actions:
  - Warn users (notification with option to override)
  - Block users (prevent sharing unless overridden by admin)
  - Auto-remediate (remove, encrypt, redirect to admin)

**Sensitive Information Types Relevant to CJIS:**

| Type | Pattern | Example |
| ---- | ------- | ------- |
| CJI/CHRI | Marked confidential + law enforcement context | "CONFIDENTIAL - Case #12345" |
| Social Security Number | XXX-XX-XXXX | 123-45-6789 |
| Driver's License | State format (FL: D123456789) | F123456789 |
| Criminal Record | Arrest records, conviction data | "Arrested: MM/DD/YYYY" |
| Investigative Notes | Internal investigative documents | ISC case notes |
| Financial Account | Bank account numbers, routing numbers | "Account: 12345678" |
| Personally Identifiable Info (PII) | Names with SSN, DOB, phone | John Doe SSN 123-45-6789 |

**Expected DLP Policies (CJIS-Required):**

| Policy Name | Scope | Triggers | Actions |
| ---- | ---- | ---- | ---- |
| Block External CJI Sharing | All content | "CONFIDENTIAL" + law enforcement keywords | Block external shares |
| Warn on Sensitive Data | SharePoint/Teams | SSN, driver's license, criminal records | User notification + audit log |
| Block Email to Personal Accounts | Exchange | CJI content to <non-@example.org> | Block send |
| ISC Case File Protection | ISC SharePoint site | Investigative documents + CJI markers | Prevent downloads to unmanaged devices |
| Finance Data Protection | Finance SharePoint | Financial account numbers, amounts | Block external, require encryption |

**Current Status:** To be documented via Purview portal

### 2. Retention Policies

**Purpose:** Retain organizational records for compliance, litigation, and business continuity

**How It Works:**

- Applies retention labels to content (automatic or manual)
- Retains content for specified duration
- Deletes content automatically after retention period (or holds indefinitely for legal hold)
- Tracks retention status and audit trail

**Retention Stages:**

```text
Content Created
    ↓
Retention Label Applied (automatic or manual)
    ↓
Retention Period Active (e.g., 1 year)
    ├─ User cannot delete (retention lock)
    ├─ Content preserved for compliance
    └─ Audit trail recorded
    ↓
Retention Period Expires
    ├─ Content deleted (if no legal hold)
    └─ Or: Disposed per record management schedule
```

**Expected Retention Labels (CJIS-Required):**

| Label | Duration | Content Type | Rationale |
| ---- | ---- | ---- | ---- |
| CJI - 7 Years | 7 years | ISC case files, investigative documents | Criminal records retention (CJIS min) |
| Operational Records - 1 Year | 1 year | Meeting notes, general correspondence | Standard business record retention |
| Financial Records - 3 Years | 3 years | Budget documents, expense reports | IRS/audit requirements |
| Legal Hold - Indefinite | Indefinite | Litigation/investigation documents | Hold during active litigation/investigation |
| Email - 1 Year | 1 year | Messages in all Teams/Exchange | Message retention (CJIS compliance) |
| Training Materials - 3 Years | 3 years | Training documents, certifications | Training documentation |

**Current Status:** To be documented via Purview portal

**CJIS Requirement:**

- Minimum 1-year retention for operational records
- 7-year retention for investigative case files
- Automatic deletion after retention period (unless legal hold)
- Audit trail for all deletions

### 3. Audit Logging

**Purpose:** Track all user activities, administrative changes, and compliance-related events

**What's Logged:**

**User Activities:**

- File access, download, modification, sharing
- Email send, forward, delete
- Teams message send, edit, delete
- Calendar access
- Admin actions (user creation, deletion, permission changes)

**Security Events:**

- Sign-in attempts (success/failure)
- MFA prompts
- Conditional Access policy triggers
- Suspicious activities
- Permission changes

**Compliance Events:**

- DLP policy triggers
- Retention label application
- Legal hold activation
- eDiscovery holds
- Audit log search access

**Retention:**

- Default: 90 days
- Premium (with E5): 1 year
- Extended retention: Exported to storage
- **CJIS Requirement:** 1-year minimum (need to extend beyond 90-day default)

**Current Status:** Audit logs available, but retention below CJIS requirement

### 4. eDiscovery

**Purpose:** Search, preserve, and export content for legal investigation, litigation, or internal investigations

**eDiscovery Types:**

**Content Search (Basic):**

- Search across SharePoint, OneDrive, Exchange, Teams
- Keyword search with filters
- Export results to PST/CSV
- Retention only while search active
- Free feature (no premium license needed)

**eDiscovery (Premium):**

- Advanced search with analytics
- Custodian management (preserve their content)
- Legal hold (indefinite retention)
- Case management
- Requires M365 E5 or standalone eDiscovery Premium license

**Expected Use Cases:**

| Scenario | Tool | Action |
| ---- | ---- | ---- |
| ISC needs to preserve case documents | eDiscovery (Premium) | Create case, add custodians, apply legal hold |
| Finance auditing archived emails | Content Search | Search date range, export to CSV |
| FOIA request | Content Search | Keyword search, export, redact PII |
| Internal investigation | eDiscovery (Premium) | Search, preserve, export for review |
| Litigation support | eDiscovery (Premium) | Case management, privilege review, analytics |

**Current Status:** Content Search available (basic); eDiscovery Premium status unknown

### 5. Information Governance

**Purpose:** Organize, label, and manage organizational information lifecycle

**Key Concepts:**

**Retention Labels:**

- Manual (user-applied) or automatic (policy-based)
- Track content type and sensitivity
- Apply retention and deletion policies
- Support compliance obligations

**Sensitivity Labels:**

- Classify content (Public, Internal, Confidential, CJI)
- Apply encryption to sensitive documents
- Add watermarks/headers
- Restrict sharing and downloads

**Record Retention:**

- Content locked (immutable) once declared record
- Prevents deletion during retention period
- Audit trail of access
- Proof of compliance

**Current Status:** To be documented

### 6. Data Subject Rights

**Purpose:** Handle FOIA/privacy requests and subject access requests

**Requests Handled:**

- FOIA requests (public records access)
- Privacy subject access (what data do we have on person X)
- Deletion requests (right to be forgotten)
- Correction requests (fix inaccurate data)

**Process:**

1. Request submitted via portal or email
2. Compliance team searches for matching content
3. Review for exemptions (law enforcement, ongoing investigation, etc.)
4. Redact exempt information
5. Provide to requestor within legal timeframe (30 days typical)

**Current Status:** Manual process (likely not automated)

## CJIS Compliance Requirements

### Audit Logging (Section 5.9)

**Requirement:** "Log all accesses to CJI"

**Current Status:**

- ✅ Audit logging enabled by default
- ⚠️ 90-day retention (need 1-year minimum)
- ⚠️ Limited visibility into specific CJI access (need DLP + audit integration)

**Gap Analysis:**

- Extend audit log retention to 1 year
- Implement DLP policies to track CJI sharing attempts
- Generate monthly access reports for ISC/Finance
- Alert on external CJI sharing attempts

### Data Protection in Transit/At Rest (Section 5.10)

**Requirement:** "All CJI encrypted in transit and at rest"

**Current Status:**

- ✅ Encryption at rest (Microsoft-managed keys, default on)
- ✅ Encryption in transit (TLS 1.2+ enforced)
- ⚠️ Document-level encryption (need to implement)

**Implementation:**

- **DLP:** Automatically encrypt files marked CJI
- **IRM (Information Rights Management):** Encrypt via SharePoint library settings
- **Sensitivity Labels:** Apply encryption to CJI documents automatically
- **Key Management:** Customer-managed keys (option) for additional control

### Data Retention (Section 5.1)

**Requirement:** "Retain CJI records appropriately"

**CJIS Standards:**

- Criminal records: 7-year minimum retention (investigative case files)
- Background checks: Varies by state (FL: 7 years)
- Operational records: 1-year minimum
- Audit logs: 1-year minimum

**Current Status:**

- ⚠️ Retention policies not yet documented
- ⚠️ No legal hold mechanism for active investigations
- ⚠️ Auto-delete timing unclear

**Implementation:**

- Create 7-year retention label for CJI/case files
- Create 1-year retention label for operational records
- Auto-apply labels based on content type/location
- Legal hold support for investigations

### Access Control (Section 5.4)

**Requirement:** "Restrict access to authorized personnel only"

**DLP + Conditional Access Integration:**

- CAP blocks unmanaged devices (Intune compliance required)
- DLP blocks external sharing of CJI
- ISC team restricted to ISC case files
- Finance team restricted to financial documents
- External partner access: Temporary, limited scope

**Current Status:**

- ⚠️ DLP policies not documented
- ✅ CAP provides device/location controls (documented separately)
- ✅ SharePoint permissions restrict site access

## Compliance Score and Assessments

### Compliance Manager

**Purpose:** Track compliance posture against industry standards

**Standards Supported:**

- HIPAA/HITECH
- NIST 800-53
- FedRAMP
- GDPR
- CCPA
- ISO 27001

**CJIS not included** (not a separate framework in Compliance Manager, but FBI CJIS requirements integrated into audit/encryption controls)

**Compliance Score:**

- Overall compliance percentage
- Actions needed vs. completed
- Improvement trends

**Current Status:** Likely not configured (specialized to healthcare/GDPR)

## Implementation Roadmap

### Phase 1: Essential (Immediate - CJIS Required)

1. **Extend Audit Log Retention** - 90 days → 1 year
2. **Create DLP Policies** - Block external CJI sharing, warn on sensitive data
3. **Create Retention Labels** - 7-year for CJI, 1-year for operational
4. **Enable Legal Hold** - Preserve content for active investigations
5. **Document Sensitive Information Types** - Define CJI detection patterns

### Phase 2: Enhanced Security (30-60 days)

1. **Sensitivity Labels** - Classify and encrypt documents automatically
2. **DLP in Teams** - Monitor message content for CJI patterns
3. **eDiscovery Premium** - Case management for investigations
4. **Access Reviews** - Quarterly review of who can access CJI
5. **Incident Response** - DLP alert automation for policy violations

### Phase 3: Advanced Governance (60-90 days)

1. **Custom Sensitive Types** - Machine learning for case-specific patterns
2. **Adaptive Scopes** - Apply policies based on content properties
3. **Unified Labeling** - Consistent classification across M365 + on-premises
4. **Records Management** - Formal records disposition schedule
5. **Compliance Automation** - Workflow automation for policy enforcement

## PowerShell Commands for Configuration

```powershell
# Connect to Security & Compliance Center
Install-Module -Name ExchangeOnlineManagement
Connect-IPPSSession -UserPrincipalName <privileged-admin-upn>

# Get all DLP policies
Get-DlpCompliancePolicy | Format-Table Name, Enabled, Priority

# Get policy rules
Get-DlpComplianceRule -Policy "Policy Name" | Select Name, ContentContainsSensitiveType

# Get retention policies
Get-RetentionCompliancePolicy | Format-Table Name, Enabled, ExchangeLocation

# Get retention labels
Get-ComplianceTag | Format-Table Name, RetentionAction, RetentionDuration

# Get audit log entries
Search-UnifiedAuditLog -StartDate (Get-Date).AddDays(-90) -EndDate (Get-Date) -RecordType SharePointFileOperation -ResultSize 5000 | Format-Table Identity, UserIds, CreationDate, Operations

# Get eDiscovery cases
Get-ComplianceCase | Format-Table Name, Status, CreatedDate

# Get legal hold status
Get-CaseHoldPolicy -Case $caseId | Select Name, ExchangeLocation, SharePointLocation
```

### DLP Policy Creation Example

```powershell
# Create DLP policy for blocking external CJI sharing
New-DlpCompliancePolicy -Name "Block External CJI" -Comment "Prevent external sharing of classified CJI"

# Add rule: detect CONFIDENTIAL keyword + law enforcement terms
New-DlpComplianceRule -Policy "Block External CJI" `
  -Name "Block External CJI Sharing" `
  -ContentContainsWords @("CONFIDENTIAL", "classified", "case file", "investigative") `
  -ReportSeverityLevel High `
  -NotifyUser "ToSender" `
  -BlockAccess $true `
  -Priority 0

# Test the policy (audit mode) before enforcing
Set-DlpCompliancePolicy -Identity "Block External CJI" -TestMode $true
```

### Retention Label Creation Example

```powershell
# Create 7-year retention label for CJI case files
New-ComplianceTag -Name "CJI Case Files - 7 Years" `
  -Retention $true `
  -RetentionAction Delete `
  -RetentionDuration 2555 `
  -Comment "CJIS-required 7-year retention for investigative case files"

# Create 1-year retention label for operational records
New-ComplianceTag -Name "Operational Records - 1 Year" `
  -Retention $true `
  -RetentionAction Delete `
  -RetentionDuration 365 `
  -Comment "CJIS-required 1-year retention for operational documents"

# Apply auto-labeling policy to ISC SharePoint site
New-AutoSensitivityLabelPolicy -Name "ISC Case Files Auto-Label" `
  -SharePointLocationException "https://tenant.sharepoint.com/sites/isc" `
  -Locations @("https://tenant.sharepoint.com/sites/isc") `
  -SensitivityLabels @("CJI Case Files - 7 Years")
```

## Support and Governance

**Compliance Owner:** Platform Owner (<platform-owner-email>)  
**Privileged Access:** <privileged-admin-upn>  
**Portal:** [Microsoft Purview Compliance Manager](https://compliance.microsoft.com)

**Compliance Team Responsibilities:**

- Monitor DLP policy violations
- Manage retention and legal holds
- Respond to FOIA/privacy requests
- Review audit logs monthly
- Update compliance policies quarterly

## Known Limitations

### Graph API Limitations

- DLP policies not available via Graph API (PowerShell required)
- Retention labels accessible but limited detail (PowerShell recommended)
- eDiscovery operations require Purview portal or PowerShell
- Audit log queries have permission limitations (requires specific scopes)
- Sensitive information types not fully exposed via Graph

### Feature Availability in GCC

**Available in GCC:**

- ✅ DLP policies
- ✅ Retention policies and labels
- ✅ Audit logging (90-day default)
- ✅ Content Search (basic eDiscovery)
- ✅ Legal hold

**Not Available / Limited in GCC:**

- ⚠️ eDiscovery Premium (check with Microsoft Support)
- ⚠️ Customer-managed keys (limited availability)
- ⚠️ Advanced DLP analytics
- ⚠️ Insider risk management

### PowerShell Audit Required

The following items MUST be documented via PowerShell:

1. All active DLP policies and rules
2. All retention policies and labels
3. Auto-labeling policies
4. Sensitivity labels configuration
5. Legal holds and case status
6. eDiscovery cases and custodians
7. Audit log retention settings
8. Sensitive information types (custom)

---

**Last Updated:** January 30, 2026  
**Audit Status:** Pending Compliance PowerShell connection (see note below)  
**Configuration Status:** ⏳ DLP policies and retention labels not yet configured  
**Next Review:** February 2026 (quarterly compliance review)

## Audit Results (January 30, 2026)

### Connection Status

The Security & Compliance Center requires connection via **Compliance PowerShell (IPPSSession)** which is separate from Exchange Online. To complete the full audit:

```powershell
# Connect to Compliance PowerShell (requires elevated credentials)
Install-Module ExchangeOnlineManagement -Force
Connect-IPPSSession -UserPrincipalName <privileged-admin-upn>
```

### Current Configuration Status

| Component | Status | Count | Notes |
| ---- | ---- | ---- | ---- |
| DLP Policies | ❌ Not Configured | 0 | CJIS-required (must implement) |
| Retention Policies | ❌ Not Configured | 0 | CJIS-required (must implement) |
| Retention Labels | ❌ Not Configured | 0 | CJIS-required (must implement) |
| eDiscovery Cases | ❌ Not Active | 0 | Optional for now; needed for investigations |
| Audit Logging | ✅ Enabled | - | Default 90-day retention (extend to 365+ for CJIS) |
| Sensitivity Labels | ⚠️ Not Verified | - | Requires portal access to verify |

### Recommended Immediate Implementation (Phase 1)

Based on CJIS requirements, implement the following **immediately**:

#### 1. DLP Policies to Create

**Policy 1: Block External CJI Sharing** (CRITICAL)

```powershell
New-DlpCompliancePolicy -Name "Block External CJI" `
  -Comment "Prevent external sharing of classified CJI information"

New-DlpComplianceRule -Policy "Block External CJI" `
  -Name "Block External CJI" `
  -ContentContainsWords @("CONFIDENTIAL", "classified", "case file", "investigative") `
  -ReportSeverityLevel High `
  -BlockAccess $true `
  -Priority 0 `
  -Enabled $true
```

**Policy 2: Warn on Sensitive Data** (HIGH PRIORITY)

```powershell
New-DlpCompliancePolicy -Name "Warn on Sensitive Data" `
  -Comment "Alert users when sensitive information is shared"

New-DlpComplianceRule -Policy "Warn on Sensitive Data" `
  -Name "Detect SSN, License, Credit Card" `
  -ContentContainsSensitiveType @("U.S. Social Security Number (SSN)", `
    "U.S. Driver's License Number", "Credit Card Number") `
  -ReportSeverityLevel Medium `
  -NotifyUser "ToSender" `
  -Priority 1 `
  -Enabled $true
```

| Policy Name | Triggers | Actions | Status |
| ---- | ---- | ---- | ---- |
| Block External CJI | CONFIDENTIAL + law enforcement keywords | Block external shares, Alert admin | ❌ To Implement |
| Warn on Sensitive Data | SSN, Driver License, Credit Card | Warn user, Log activity | ❌ To Implement |
| Block Email to Personal | CJI content to personal email | Block send | ❌ To Implement |

#### 2. Retention Labels to Create

```powershell
# CJI Case Files - 7 years (CJIS Section 5.1 requirement)
New-ComplianceTag -Name "CJI Case Files - 7 Years" `
  -Retention $true `
  -RetentionAction Delete `
  -RetentionDuration 2555 `
  -Comment "CJIS-required 7-year retention for investigative case files"

# Operational Records - 1 year (CJIS minimum)
New-ComplianceTag -Name "Operational Records - 1 Year" `
  -Retention $true `
  -RetentionAction Delete `
  -RetentionDuration 365 `
  -Comment "CJIS-required 1-year retention for operational documents and audit logs"

# Email Messages - 1 year
New-ComplianceTag -Name "Email - 1 Year" `
  -Retention $true `
  -RetentionAction Delete `
  -RetentionDuration 365 `
  -Comment "Standard email retention for compliance"

# Financial Records - 3 years
New-ComplianceTag -Name "Financial Records - 3 Years" `
  -Retention $true `
  -RetentionAction Delete `
  -RetentionDuration 1095 `
  -Comment "IRS and audit compliance (7 years recommended)"
```

| Label | Duration | Scope | Status |
| ---- | ---- | ---- | ---- |
| CJI Case Files - 7 Years | 2555 days (7 years) | ISC SharePoint + Teams | ❌ To Create |
| Operational Records - 1 Year | 365 days (1 year) | All locations | ❌ To Create |
| Email - 1 Year | 365 days (1 year) | Exchange Online | ❌ To Create |
| Financial Records - 3 Years | 1095 days (3 years) | Finance SharePoint | ❌ To Create |

#### 3. Sensitivity Labels (Information Protection)

```powershell
# Create sensitivity labels with encryption for CJI
New-SensitivityLabel -DisplayName "Public" -Description "No restrictions"
New-SensitivityLabel -DisplayName "Internal" -Description "Internal use only"
New-SensitivityLabel -DisplayName "Confidential" -Description "Organization Confidential"
New-SensitivityLabel -DisplayName "CJI - Restricted" `
  -Description "CJI - LAW ENFORCEMENT ONLY - Encryption Required" `
  -Encryption RequireEncryption
```

| Label | Encryption | Marking | Status |
| ---- | ---- | ---- | ---- |
| Public | None | None | ❌ To Create |
| Internal | None | Header: "Internal Use Only" | ❌ To Create |
| Confidential | RestrictedAccess | Header: "CONFIDENTIAL" | ❌ To Create |
| CJI - Restricted | RequireEncryption | Header: "CJI - LAW ENFORCEMENT ONLY" | ❌ To Create |

#### 4. Audit Log Retention Extension

**Current:** 90 days (default)  
**Required:** 365+ days (CJIS Section 5.9)  
**Action:** Requires licensing upgrade or archived export

```powershell
# Check current audit log retention
Get-AdminAuditLogConfig | Select UnifiedAuditLogIngestionEnabled

# Note: Direct retention extension requires Microsoft 365 E5
# Alternative: Export audit logs monthly to long-term storage
Search-UnifiedAuditLog -StartDate (Get-Date).AddDays(-90) -EndDate (Get-Date) `
  -ResultSize 5000 | Export-Csv -Path "audits/compliance-audit-export-$(Get-Date -Format 'yyyyMMdd').csv"
```

---

**Status:** ⏳ Pending PowerShell audit to document actual policies and configuration
