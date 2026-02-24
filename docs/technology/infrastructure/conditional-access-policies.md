# Conditional Access Policies

## Overview

Conditional Access Policies (CAP) are Azure Entra ID (formerly Azure AD) rules that enforce security controls on user access to organizational resources. CAP evaluates conditions (device, location, user, risk) and applies enforcement (block, require MFA, require compliant device, etc.) before granting access to apps and resources.

**Service Type:** Cloud-based Identity and Access Management  
**License:** Requires Azure Entra ID Premium P1 or P2  
**Compliance:** CJIS-required (for MFA and device compliance enforcement)

## Service Details

**Admin Portal:** [Azure Portal - Conditional Access](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade)  
**Environment:** GCC (Government Community Cloud)  
**Implementation:** Azure Entra ID with M365 GCC  
**Integration:** Protects access to all cloud apps (Teams, SharePoint, OneDrive, Exchange Online, etc.)

## Conditional Access Architecture

### Policy Components

**Each CAP consists of:**

1. **Assignments (Conditions)**
   - Users/Groups (who the policy applies to)
   - Cloud applications (which apps are protected)
   - Conditions:
     - Device state (managed/compliant, platform)
     - Sign-in risk (real-time risk detection)
     - User risk (offline risk calculation)
     - Location (IP ranges, named locations)
     - Client app (legacy auth, mobile apps, desktop)

2. **Access Controls (Actions)**
   - **Grant:** Allow with conditions:
     - Require MFA
     - Require device compliance
     - Require approved client app
     - Require password change
   - **Block:** Deny access completely

3. **Session Controls (for Premium)**
   - App enforced restrictions
   - Conditional Access app control (real-time monitoring)
   - Sign-in frequency
   - Persistent browser session

### Policy Evaluation Flow

```text
User Attempts Login
    ↓
Check Conditional Access Policies
    ↓
Does user/app match assignment?
    ├─ NO → Allow access (no policy applies)
    └─ YES → Check conditions
        ↓
        Are conditions met?
        ├─ NO → Allow/block based on grant control
        └─ YES → Apply access control
            ├─ Block → Deny access
            ├─ Grant (no MFA) → Allow access
            ├─ Grant (MFA required) → Prompt for MFA
            ├─ Grant (Device compliant) → Check device compliance
            └─ Grant (Multiple) → All must be satisfied
```

## Policy Types and Recommendations

### CJIS-Required Policies

#### 1. Multi-Factor Authentication (MFA) for Privileged Users

**Policy Name:** Require MFA for Global Admins  
**Target:** Global Administrators, Security Administrators, Conditional Access Admins  
**Condition:** All cloud apps, all platforms  
**Control:** Require MFA (Authenticator app, phone call, SMS - MFA app preferred)  
**Rationale:** CJIS Section 5.3.4 - Privileged users must use strong multi-factor authentication

**Status:** To be documented via PowerShell

#### 2. Device Compliance Enforcement

**Policy Name:** Require compliant devices for Intune-managed devices  
**Target:** All users  
**Condition:** Device platforms (Windows, macOS, iOS, Android)  
**Control:**

- Windows/macOS: Require Intune enrollment + compliance
- iOS/Android: Require managed device + compliance
**Rationale:** CJIS Section 5.3 - Only compliant, managed devices can access CJI

**Status:** To be documented via PowerShell

#### 3. Block Legacy Authentication

**Policy Name:** Block legacy authentication protocols  
**Target:** All users  
**Condition:** Client apps (Exchange ActiveSync, legacy apps, IMAP, etc.)  
**Control:** Block  
**Rationale:** Legacy protocols lack MFA, modern auth enforcement required

**Status:** To be documented via PowerShell

#### 4. Location-Based Access Control

**Policy Name:** Allow access only from known office locations  
**Target:** All users  
**Condition:** Location (IP whitelist - HQ, remote offices, partner agencies)  
**Control:** Block access from unknown locations (or require extra verification)  
**Rationale:** CJIS Section 5.4 - Restrict access to known/approved locations for CJI

**Status:** To be documented via PowerShell

### Recommended Additional Policies

#### 5. Risk-Based Conditional Access

**Policy Name:** Block high-risk sign-ins  
**Target:** All users  
**Condition:** Sign-in risk (medium, high detected by Azure AD)  
**Control:** Block (or require MFA + password change)  
**Rationale:** Prevent account compromise from suspicious locations/patterns

#### 6. Session Controls for Sensitive Apps

**Policy Name:** App enforced restrictions for ISC/Finance apps  
**Target:** ISC and Finance staff accessing sensitive apps  
**Condition:** Specific apps (SharePoint for ISC, Finance systems)  
**Control:** Require app enforced restrictions (DLP, audit on every access)  
**Rationale:** Additional DLP enforcement for sensitive investigations/financial data

#### 7. Password Change on Risk

**Policy Name:** Require password reset on user risk detected  
**Target:** All users  
**Condition:** User risk (medium, high)  
**Control:** Require password change  
**Rationale:** Mitigate account compromise if credentials leaked

## Current Policy Inventory

**Last Audited:** January 28, 2026 (PowerShell via Microsoft Graph)

### Policy Inventory Overview

- **Total Policies:** 9
  - **Enabled (Enforced):** 4 policies actively blocking/requiring actions
  - **Report-Only Mode:** 5 policies monitoring but not enforcing
- **Created:** January 7-8, 2026 (recent deployment)
- **CJIS Compliance Status:** ✅ Core policies enabled (MFA, legacy auth block)

### Active Policies (Enforced)

#### 1. Require multifactor authentication for admins

- **Status:** ✅ Enabled (enforced)
- **Created:** January 7, 2026
- **Target Users:** Admin roles (Global Admins, Security Admins, etc.)
- **Target Apps:** All cloud applications
- **Conditions:** None (always applies to admins)
- **Grant Control:** Require MFA
- **CJIS Compliance:** ✅ Section 5.3.4 (MFA for privileged users)

#### 2. Block legacy authentication

- **Status:** ✅ Enabled (enforced)
- **Created:** January 7, 2026
- **Target Users:** All users
- **Target Apps:** All cloud applications
- **Conditions:** Client apps (legacy protocols - Exchange ActiveSync, IMAP, POP3, SMTP)
- **Grant Control:** Block access
- **CJIS Compliance:** ✅ Section 5.3 (modern authentication enforcement)

#### 3. Require multifactor authentication for all users

- **Status:** ✅ Enabled (enforced)
- **Created:** January 7, 2026
- **Target Users:** All users
- **Target Apps:** All cloud applications
- **Conditions:** None (universal MFA requirement)
- **Grant Control:** Require MFA
- **CJIS Compliance:** ✅ Section 5.3 (MFA for CJI access)

#### 4. Require multifactor authentication for Azure management

- **Status:** ✅ Enabled (enforced)
- **Created:** January 7, 2026
- **Target Users:** All users
- **Target Apps:** Azure Management (App ID: 797f4846-ba00-4fd7-ba43-dac1f8f63013)
- **Conditions:** None
- **Grant Control:** Require MFA
- **CJIS Compliance:** ✅ Protects Azure admin portal access

### Policies in Report-Only Mode (Not Enforced)

#### 5. Strong MFA Requirement

- **Status:** ⏳ Report-Only (monitoring, not enforcing)
- **Created:** January 8, 2026
- **Target Users:** All users
- **Target Apps:** All cloud applications
- **Conditions:** To be documented
- **Grant Control:** None (report-only)
- **Next Step:** Review reports, enable when ready

#### 6. No persistent browser session

- **Status:** ⏳ Report-Only (monitoring, not enforcing)
- **Created:** January 8, 2026
- **Target Users:** All users
- **Target Apps:** All cloud applications
- **Conditions:** Session controls
- **Grant Control:** None (session control)
- **Purpose:** Require re-authentication after browser close
- **CJIS Alignment:** Section 5.3.5 (session timeout)

#### 7. Require MDM-enrolled and compliant device to access cloud apps for all users (Preview)

- **Status:** ⏳ Report-Only (monitoring, not enforcing)
- **Created:** January 8, 2026
- **Target Users:** All users
- **Target Apps:** All cloud applications
- **Conditions:** Device compliance (Intune enrollment + compliance)
- **Grant Control:** Require compliant device
- **CJIS Alignment:** ✅ Section 5.4 (device compliance requirement)
- **Next Step:** Enable after all devices enrolled in Intune

#### 8. Block access for unknown or unsupported device platform

- **Status:** ⏳ Report-Only (monitoring, not enforcing)
- **Created:** January 8, 2026
- **Target Users:** All users
- **Target Apps:** All cloud applications
- **Conditions:** Device platform (block unknown platforms)
- **Grant Control:** Block access
- **Purpose:** Prevent access from unmanaged/unknown device types
- **Next Step:** Review supported platforms, enable enforcement

#### 9. Use application enforced restrictions for O365 apps

- **Status:** ⏳ Report-Only (monitoring, not enforcing)
- **Created:** January 8, 2026
- **Target Users:** All users
- **Target Apps:** Office 365 (SharePoint, OneDrive, Exchange, Teams)
- **Conditions:** Application-specific restrictions
- **Grant Control:** None (app enforced restrictions)
- **Purpose:** DLP enforcement at app level
- **Next Step:** Configure app restrictions, enable enforcement

### Policy Summary Table

| Policy Name | Status | Target | Control | CJIS Compliant |
| ------------------------------------------------ | -------- | --------- | ------------- | -------------- |
| Require MFA for admins | ✅ Enabled | Admin roles | Require MFA | ✅ Yes |
| Block legacy authentication | ✅ Enabled | All users | Block | ✅ Yes |
| Require MFA for all users | ✅ Enabled | All users | Require MFA | ✅ Yes |
| Require MFA for Azure management | ✅ Enabled | All users | Require MFA | ✅ Yes |
| Strong MFA Requirement | ⏳ Report-Only | All users | TBD | ⏳ Pending |
| No persistent browser session | ⏳ Report-Only | All users | Session timeout | ⏳ Pending |
| Require compliant device | ⏳ Report-Only | All users | Device compliance | ⏳ Pending |
| Block unknown device platforms | ⏳ Report-Only | All users | Block | ⏳ Pending |
| App enforced restrictions (O365) | ⏳ Report-Only | All users | App restrictions | ⏳ Pending |

### Known/Expected Policies (Legacy - Replaced by Actual Audit Above)

The following policies are likely configured based on IT governance:

| Policy Name | Type | Target | Control | Status |
| -------------------- | -------- | --------- | -------- | ------------- |
| Require MFA for Admins | MFA | Admin roles | Require MFA | Likely active |
| Block Legacy Auth | Auth | All users | Block | Likely active |
| Require Device Compliance | Device | All users | Compliance | Likely active |
| Location-Based Access | Location | All users | Block/verify | Unknown |
| High Risk Sign-in Block | Risk | All users | Block | Unknown |
| ISC Access Controls | Session | ISC staff | DLP enforced | Unknown |
| Finance Access Controls | Session | Finance staff | DLP enforced | Unknown |

## Access Control Strategies

### User-Based Controls

#### Admin/Privileged Users

- Require MFA (mandatory)
- Require device compliance (Intune enrolled, antivirus, disk encryption)
- Restrict location (office networks only)
- Disable legacy auth
- Require latest authentication (modern auth only)

#### Department Users (ISC, Finance)

- Require MFA (for sensitive data access)
- Require device compliance (if accessing CJI)
- Restrict location (office, pre-approved remote)
- Allow legacy auth only if necessary (with audit)

**Regular Users:**

- Require MFA (recommended for all)
- Device compliance (optional, recommended)
- Location: No restriction (allow mobile access)
- Legacy auth: Block (enforce modern auth)

### App-Based Controls

#### Sensitive Apps (ISC, Finance, HR Systems)

- Require MFA
- Require device compliance
- Require approved app (Teams/Outlook only, block web access)
- Session controls (app enforced DLP, continuous access verification)

**Collaboration Apps (Teams, SharePoint, OneDrive):**

- Require MFA (for privileged users)
- Require device compliance (recommended)
- Legacy auth: Block
- Allow web access (modern auth)

**External/Partner Apps:**

- Require MFA (all)
- Restrict location (office networks)
- Require approved app
- Guest access: Limited scope only

## Device Compliance Integration

### Conditional Access and Intune Compliance

Policies enforce Intune compliance standards:

#### Windows Devices

- Intune enrollment required
- Antivirus enabled (Windows Defender)
- Firewall enabled
- Disk encryption enabled (BitLocker)
- Password policy (min 14 chars, complexity)
- OS version current (not > 30 days old)

#### macOS Devices

- Intune enrollment required
- Antivirus enabled (Microsoft Defender)
- Firewall enabled
- Disk encryption enabled (FileVault)
- Password policy (min 14 chars, complexity)
- OS version current

#### iOS/Android

- Mobile Device Management (MDM) enrollment
- Passcode required (min 6 digits)
- Device encryption enabled
- Jailbreak/root detection
- OS version current

#### Non-Compliant Device Handling

- Block access to CJI resources
- Allow limited access to general apps (Teams, email)
- Require remediation (apply security patches)
- Boot camp mode (block access until compliant)

## Authentication Methods

### MFA Options Supported

**Microsoft Authenticator App** (Preferred - CJIS)

- Push notification approval
- Password-less phone sign-in
- Passwordless sign-in to Windows
- Hardware token support (if on Premium)

**Phone Call** (Backup)

- Call to verified phone number
- Automated voice prompt
- Requires landline or mobile

**SMS/Text Message** (Not recommended - CJIS)

- Text to verified phone
- User enters code
- Vulnerable to interception

**OATH Hardware Tokens** (Enterprise)

- Physical token (RSA, Yubikey, etc.)
- 6-digit code generator
- No phone dependency

**Windows Hello** (Desktop)

- Biometric (face/fingerprint)
- PIN
- Hardware token
- Desktop/laptop only

**CJIS Recommendation:** Authenticator app (mobile) > Phone call > OATH hardware > SMS (avoid)

## Sign-In Risk Detection

### Risk Scenarios (Triggering MFA)

**Real-Time Risk Signals:**

- Impossible travel (logged in from NYC then Tokyo in 1 hour)
- Unfamiliar sign-in properties (new country, device, browser)
- Sign-in from IP address with malicious activity
- Anonymous IP address (VPN/proxy detected)
- Leaked credentials (password found in dark web breach)

**User Risk Signals:**

- Multiple failed login attempts
- Suspicious activity on account (offline risk)
- User's password compromised in known breach

### Policy Response

**Low Risk:**

- Allow access (normal flow)
- Optional: Require MFA

**Medium Risk:**

- Require MFA (mandatory)
- Require password change
- Device check

**High Risk:**

- Block access (deny)
- Or: Require MFA + password change + device compliance
- Require session with supervision

## Session Control and Monitoring

### Conditional Access App Control (Premium)

**Real-Time Monitoring:**

- Monitor all app usage in real-time
- Apply DLP policies on sensitive data
- Prevent downloads to unmanaged devices
- Block copy/paste of sensitive data
- Prevent printing from unmanaged devices
- Monitor file uploads to personal accounts

**Example:** ISC analyst accesses SharePoint case files

- App control enforces DLP
- Blocks download to non-compliant device
- Logs all file access
- Prevents email exfiltration

### Sign-In Frequency

**Policy Control:**

- Require re-authentication every X hours
- Reauthentication on token expiration
- Prevents indefinite session duration

**CJIS Requirement:** 30-minute session timeout for CJI access (typical)

## Policy Audit and Compliance

### What Needs Documenting (PowerShell)

1. **All Active Policies**
   - Policy name and description
   - Target users/groups
   - Cloud apps protected
   - Conditions (device, location, risk, auth)
   - Grant controls (allow, require MFA, require compliance, block)
   - Session controls (if Premium)
   - Enabled/disabled status
   - Order of evaluation

2. **Risk Policies**
   - Sign-in risk evaluation enabled?
   - User risk evaluation enabled?
   - Risk thresholds (low, medium, high)
   - Policy responses for each risk level

3. **Named Locations**
   - IP ranges for office locations
   - Trusted IP addresses
   - Excluded locations

4. **App List**
   - All cloud apps in scope
   - Legacy auth protocols allowed/blocked
   - Specific app restrictions

## CJIS Compliance Requirements

### Section 5.3 - Multi-Factor Authentication

**Requirement:** All users accessing CJI must use MFA  
**Implementation:** CAP requiring MFA for apps containing CJI  
**Verification:** CAP policy audit + user MFA registration report

#### Current Status

- ✅ MFA technology deployed (Authenticator app, phone call)
- ✅ MFA enforced for all users (Policy: "Require MFA for all users")
- ✅ MFA enforced for admins (Policy: "Require MFA for admins")
- ✅ MFA enforced for Azure management (Policy: "Require MFA for Azure management")
- ⏳ 100% user enrollment verification needed (check Entra ID MFA registration report)

#### Gap Analysis

- ✅ **COMPLIANT** - MFA policies enabled and enforcing
- ⏳ Verify all 40 users have registered MFA methods
- ⏳ Monitor MFA policy violations monthly

### Section 5.4 - Access Control

**Requirement:** Access restricted to authorized personnel with documented need-to-know  

#### Access Control Status

- ✅ Device compliance policy created (report-only mode)
- ⏳ Device compliance enforcement pending (enable Policy #7)
- ✅ Legacy authentication blocked (prevents unmanaged device access)
- ⏳ Location-based policies not yet configured
- ⏳ Group-based access controls (managed via Entra ID groups)

#### Access Control Gaps

- ✅ Device compliance technology available (Intune)
- ⏳ Enable device compliance enforcement (Policy #7 from report-only → enabled)
- ⏳ Create location-based policies (office IP whitelist)
- ⏳ Group membership audit needed (verify ISC/Finance access)

### Section 5.10 - Encryption

**Requirement:** All data encrypted in transit and at rest  

#### Encryption Implementation

- TLS encryption for all sign-ins (enforced by Azure AD)
- CAP can block unencrypted protocols (legacy auth block)
- Device compliance requiring disk encryption (BitLocker, FileVault)

#### Encryption Gaps

- ✅ Encryption infrastructure in place
- ✅ Legacy auth blocking (recommended)
- ⚠️ Device compliance enforcement status unknown

## PowerShell Commands for CAP Audit

```powershell
# Install Azure AD PowerShell module
Install-Module -Name AzureAD

# Connect to Azure AD
Connect-AzureAD

# Get all Conditional Access policies
Get-AzureADMSConditionalAccessPolicy | Format-Table DisplayName, State, Id

# Get policy details
$policyId = "12345678-1234-1234-1234-123456789012"
Get-AzureADMSConditionalAccessPolicy -PolicyId $policyId | Select -ExpandProperty *

# Get specific policy rules
Get-AzureADMSConditionalAccessPolicy -PolicyId $policyId | Select Conditions, GrantControls, SessionControls

# Get all named locations (IP whitelists)
Get-AzureADMSNamedLocationPolicy

# Get all cloud apps
Get-AzureADMSApplication | Select AppId, DisplayName, SignInAudience

# Get sign-in risk detection policy
Get-AzureADMSRiskyUser
Get-AzureADMSRiskySignIn

# Get MFA policy details
Get-AzureADMSConditionalAccessPolicy | Where {$_.GrantControls.BuiltInControls -contains "mfa"} | Format-Table DisplayName, State
```

### Policy Export Script

```powershell
# Export all CAP policies to CSV
$policies = Get-AzureADMSConditionalAccessPolicy
$policies | Export-Csv -Path ".\conditional-access-policies.csv" -NoTypeInformation

# Export detailed policy info
$policies | ForEach-Object {
    [PSCustomObject]@{
        DisplayName = $_.DisplayName
        State = $_.State
        Users = ($_.Conditions.Users.IncludeUsers | Join-String -Separator ",")
        Groups = ($_.Conditions.Users.IncludeGroups | Join-String -Separator ",")
        Apps = ($_.Conditions.Applications.IncludeApplications | Join-String -Separator ",")
        Platforms = ($_.Conditions.Platforms.IncludePlatforms | Join-String -Separator ",")
        Locations = ($_.Conditions.Locations.IncludeLocations | Join-String -Separator ",")
        GrantControls = ($_.GrantControls.BuiltInControls | Join-String -Separator ",")
        BlockAccess = $_.GrantControls.Operator -eq "OR"
    }
} | Export-Csv -Path ".\cap-detailed.csv" -NoTypeInformation
```

## Implementation Roadmap

### Phase 1: Essential Policies (Immediate - CJIS Required)

1. **MFA for Admins** - Enforce Authenticator app for Global/Security Admins
2. **Block Legacy Auth** - Disable IMAP, ActiveSync, SMTP without MFA
3. **Device Compliance Enforcement** - Require Intune compliance for all devices
4. **Location Baseline** - Document office IP ranges and create named location

### Phase 2: Enhanced Security (30-60 days)

1. **Risk-Based MFA** - Require MFA on medium/high-risk sign-ins
2. **ISC Access Control** - App enforced restrictions for sensitive apps
3. **Location Enforcement** - Block access from unknown locations
4. **Session Control** - Implement sign-in frequency (30 min timeout)

### Phase 3: Advanced Controls (60-90 days)

1. **Application Control** - Real-time DLP on sensitive apps
2. **Token Lifetimes** - Reduce token lifetime for sensitive operations
3. **Device Control** - Require specific approved apps (Teams/Outlook only)
4. **Continuous Verification** - Evaluate compliance on every request

## Support and Documentation

**Conditional Access Admin:** Platform Owner (<platform-owner-email>)  
**Privileged Access:** <<privileged-admin-upn>>  
**Azure Portal:** [Conditional Access Policies](https://portal.azure.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade)

## Known Limitations

### Graph API Limitations

- Graph API has limited CAP query support (Policy.Read.All scope required)
- Detailed policy structures, grant controls, session controls not fully exposed
- Real-time risk evaluation details not available via Graph API
- Requires Azure AD PowerShell (legacy) or Microsoft Graph v1.0 (beta features)

### PowerShell Audit Required

The following items MUST be documented via PowerShell (not available via Graph API):

1. All active Conditional Access policies
2. Policy assignment (users, groups, apps, conditions)
3. Grant controls and session controls
4. Named location IP ranges
5. Risk detection policies
6. MFA enforcement status
7. Legacy authentication blocks
8. Device compliance requirements
9. Policy order and evaluation sequence
10. Exemptions and exclusions

## 8. Recommendations

Based on the current audit (January 2026), the following actions are recommended:

### High Priority

1. **Enable Device Compliance Policy**
   - Current: "Require MDM-enrolled and compliant device" in report-only mode
   - Action: Review report-only data, then enable enforcement
   - Timeline: Within 30 days
   - CJIS Impact: Required for full compliance with access control requirements

2. **Review Strong MFA Configuration**
   - Current: "Strong MFA Requirement" policy exists but details TBD
   - Action: Document specific authentication strength requirements
   - Timeline: Within 14 days
   - Consideration: May require phishing-resistant methods (FIDO2, Windows Hello)

### Medium Priority

1. **Activate Session Control Policies**
   - "No persistent browser session" currently in report-only
   - Review usage patterns from report-only data
   - Enable if no significant user impact identified
   - Timeline: Within 60 days

2. **Platform Blocking Review**
   - "Block access for unknown or unsupported device platform" in report-only
   - Identify any legitimate unsupported platforms
   - Enable after exception process established
   - Timeline: Within 60 days

3. **Application Restrictions Testing**
   - "Use application enforced restrictions for O365 apps" in report-only
   - Validate SharePoint/Exchange app restrictions functionality
   - Enable after user training completed
   - Timeline: Within 90 days

### Ongoing Monitoring

1. **MFA Registration Coverage**
   - Verify all 40 Entra ID users have MFA methods registered
   - Generate registration report: `Get-MgReportAuthenticationMethodUserRegistrationDetail`
   - Monthly review cadence

2. **Sign-in Risk Detection**
   - Consider enabling Entra ID P2 sign-in risk policies
   - Requires Identity Protection license upgrade
   - Provides automated risk-based access control

3. **Legacy Auth Monitoring**
   - "Block legacy authentication" enabled - monitor for blocked attempts
   - Review sign-in logs for legacy auth attempts: `Get-MgAuditLogSignIn -Filter "clientAppUsed eq 'Other clients'"`
   - Identify any remaining applications requiring legacy auth

## 9. References

- **FBI CJIS Security Policy 5.4**: Access Control
- **NIST SP 800-53**: Access Control (AC) family
- **Microsoft Conditional Access Documentation**: <https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/>
- **CJIS Security Policy**: <https://www.fbi.gov/services/cjis/cjis-security-policy-resource-center>

---

**Last Updated:** January 8, 2026  
**Document Version:** 1.2  
**Next Review:** April 2026 (quarterly security review)  
**Status:** ✅ PowerShell audit completed January 8, 2026
