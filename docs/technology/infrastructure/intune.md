# Microsoft Intune

## Overview

Microsoft Intune is Central Florida HIDTA's cloud-based endpoint management solution for managing mobile devices, desktop computers, and applications. Intune is included with the Microsoft 365 G3 GCC license.

**Service Type:** Cloud-based Mobile Device Management (MDM) and Mobile Application Management (MAM)  
**License:** Included with Microsoft 365 G3 GCC  
**Compliance:** CJIS-compliant (GCC environment)

## Service Details

**Portal:** [Microsoft Intune admin center](https://intune.microsoft.com)  
**Environment:** GCC (Government Community Cloud)  
**Tenant:** example.org  
**Status:** Enabled (included in M365 G3 GCC subscription)

## Capabilities

### Device Management

- **Mobile Device Management (MDM)**
  - iOS/iPadOS device enrollment and management
  - Android device enrollment and management
  - Windows 10/11 device management
  - macOS device management

- **Endpoint Security**
  - Device compliance policies
  - Conditional access integration with Azure AD
  - Encryption requirements (BitLocker for Windows, FileVault for macOS)
  - Security baseline configuration

- **Configuration Management**
  - Device configuration profiles
  - Wi-Fi, VPN, and email settings deployment
  - Certificate deployment (SCEP, PKCS)
  - Custom settings (OMA-URI for Windows, custom profiles for iOS/macOS)

### Application Management

- **Mobile Application Management (MAM)**
  - App protection policies (without device enrollment)
  - Data loss prevention for mobile apps
  - App-level encryption and access controls

- **Application Deployment**
  - Microsoft 365 Apps deployment
  - Line-of-business (LOB) app distribution
  - Public app store app deployment (iOS App Store, Google Play)
  - Win32 app deployment for Windows

- **App Configuration**
  - Managed app configuration for iOS/Android
  - App protection policies
  - Conditional launch requirements

### Security Features

- **Compliance Policies**
  - Device health attestation
  - Encryption requirements
  - OS version requirements
  - Jailbreak/root detection
  - Password complexity requirements

- **Conditional Access**
  - Integration with Azure AD Conditional Access
  - Device compliance as access condition
  - App protection policy enforcement
  - Risk-based access controls

- **Threat Protection**
  - Microsoft Defender for Endpoint integration (included in M365 G3)
  - Mobile threat defense (MTD) partner integration
  - App protection policy blocking for risky devices

## License Integration

Intune is included in the **Microsoft 365 G3 GCC** license:

- **Service Plan ID:** `c1ec4a95-1f05-45b3-a911-aa3fa01094f5`
- **Service Plan Name:** `INTUNE_A`
- **Status:** Success (enabled for all M365 G3 users)
- **Total Available Licenses:** 25 (matches M365 G3 count)

**Note:** Intune for Office 365 (`INTUNE_O365`) is also available in the suspended Office 365 E3 GCC subscription but is in PendingActivation status.

## Deployment Status

### Current Implementation

**Status:** Active - 25 managed devices across multiple platforms  
**Last Updated:** January 28, 2026

**Enrollment Methods:**

- [x] Azure AD Join (automatic MDM enrollment)
- [x] Company Portal enrollment
- [x] Apple Business Manager (ABM) integration (suspected)
- [ ] Windows Autopilot
- [ ] Bulk enrollment
- [ ] Android Enterprise enrollment

**Managed Devices:**

- **Windows devices:** 14 (100% compliant)
- **macOS devices:** 6 (100% compliant)
- **iOS/iPadOS devices:** 3 (100% compliant)
- **Android devices:** 2 (0% compliant - no Android policy deployed)
- **Total:** 25 devices

### Configuration Profiles

**Deployed Profiles:**

| Profile Name | Platform | Type | Created |
| ------------ | -------- | --------------------------------- | ---------- |
| Update Ring | Windows | Windows Update for Business | 2025-09-04 |

**Configuration Details:**

- **Update Ring**: Manages Windows Update deployment rings for Windows 10/11 devices
  - Controls update deferrals and deployment scheduling
  - Ensures consistent update compliance across Windows fleet

**Profiles To Be Configured:**

- Wi-Fi profiles (law enforcement networks)
- VPN profiles (secure remote access)
- Email profiles (Exchange ActiveSync)
- Certificate profiles (authentication certificates)
- Custom configuration profiles (platform-specific settings)

### Compliance Policies

**Deployed Policies:**

| Policy Name | Platform | Created | Status |
| ---------------------------------------- | ----------- | ---------- | ------ |
| Windows 10/11 Compliance Policy | Windows | 2026-01-05 | Active |
| Compliance Policy - macOS | macOS | 2025-09-04 | Active |
| Default Android (AOSP) Compliance Policy | Android | 2025-10-21 | Active |

**Compliance Results:**

- **Windows:** 14/14 compliant (100%)
- **macOS:** 6/6 compliant (100%)
- **iOS:** 3/3 compliant (100% - no iOS-specific policy, using default)
- **Android:** 0/2 compliant (0% - Android AOSP policy may not apply to enrolled devices)

**Policy Requirements (estimated):**

- Device encryption enabled
- Minimum OS version requirement
- Password/PIN complexity
- Jailbreak/root detection
- Device health attestation (Windows)

**Missing Policies:**

- Dedicated iOS/iPadOS compliance policy (currently relying on defaults)
- Android Enterprise compliance policy (AOSP policy not effective for standard enrollments)

### Application Deployment

To be documented:

- Microsoft 365 Apps for enterprise
- Line-of-business applications
- App protection policies
- App configuration policies

## CJIS Compliance Configuration

### Required Security Controls

**Device Encryption:**

- Windows: BitLocker encryption required
- macOS: FileVault encryption required
- iOS: Native encryption enabled
- Android: Device encryption required

**Password Requirements:**

- Minimum length: 8 characters (CJIS requires complex passwords)
- Password complexity: Uppercase, lowercase, numbers, special characters
- Maximum password age: 90 days
- Password history: Last 10 passwords
- Account lockout: 5 failed attempts

**Device Compliance:**

- Jailbreak/root detection: Block compromised devices
- Minimum OS version: Latest supported version
- Device health attestation: Required for Windows
- Encryption: Required on all devices

**Conditional Access:**

- Require compliant device for M365 access
- Require approved app for mobile access
- Block legacy authentication
- MFA enforcement through Azure AD

### Audit and Logging

All Intune activities are logged to:

- **Azure AD Audit Logs** - Administrative actions
- **Intune Device Actions** - Enrollment, wipe, retire actions
- **Compliance Reports** - Device compliance status

**Retention:** 30 days (Azure AD default), export to SIEM for extended retention

## Management

### Admin Roles

**Intune-Specific Roles:**

- Intune Administrator: Full Intune management
- Endpoint Security Administrator: Security policy management
- Cloud Device Administrator: Device enrollment and management
- Application Administrator: App deployment and management

**Current Administrators:** TBD

### Device Enrollment

**Windows Enrollment:**

```powershell
# Windows Autopilot enrollment
# Devices must be registered in Windows Autopilot service
# Users sign in with Azure AD credentials during OOBE
```

**iOS/iPadOS Enrollment:**

- Apple Business Manager (ABM) integration recommended
- Company Portal app enrollment
- Device Enrollment Program (DEP) for supervised devices

**Android Enrollment:**

- Android Enterprise work profile
- Fully managed devices for corporate-owned devices
- Company Portal app enrollment

**macOS Enrollment:**

- Apple Business Manager integration
- Company Portal app enrollment

### Common Management Tasks

**Deploy Configuration Profile:**

1. Navigate to: Devices → Configuration profiles → Create profile
2. Select platform (Windows, iOS, Android, macOS)
3. Choose profile type (Device restrictions, Wi-Fi, VPN, etc.)
4. Configure settings
5. Assign to groups (users or devices)

**Create Compliance Policy:**

1. Navigate to: Devices → Compliance policies → Create policy
2. Select platform
3. Configure compliance settings
4. Set actions for non-compliance
5. Assign to groups

**Deploy Application:**

1. Navigate to: Apps → All apps → Add
2. Select app type (Microsoft 365, Store app, Win32, LOB)
3. Configure app information
4. Set assignments (Required, Available, Uninstall)
5. Monitor deployment status

### Reporting

**Built-in Reports:**

- Device compliance dashboard
- Device enrollment status
- Application installation status
- Conditional access impact
- Security baseline compliance

**Custom Reports:**

- Export to Excel/CSV
- Power BI integration
- Microsoft Graph API queries

## Graph API Access

Tenant-specific Intune Graph permissions, app registrations, consent state, and operational queries are maintained in the private `Central-Florida-HIDTA/Microsoft365` repository.

This public template intentionally excludes tenant identifiers, consent records, and app registration inventory.

## Integration Points

### Azure Active Directory

- **Device Registration:** Intune-managed devices auto-register in Azure AD
- **Conditional Access:** Device compliance enforced via CA policies
- **User Groups:** Assignment groups sourced from Azure AD
- **SSO:** Single sign-on for enrolled devices

### Microsoft Defender for Endpoint

- **Onboarding:** Automatic MDE onboarding for Intune-managed Windows devices
- **Threat Intelligence:** MDE threat data visible in Intune console
- **Risk Levels:** Device risk scores from MDE used in Conditional Access
- **License:** MDE Lite included with M365 G3 GCC

### Microsoft 365 Apps

- **Deployment:** M365 Apps deployed via Intune
- **Configuration:** Office configuration policies managed in Intune
- **Updates:** Update rings controlled by Intune policies

### VPN and Network Access

- **VPN Profiles:** Deploy VPN configurations to devices
- **Wi-Fi Profiles:** Corporate Wi-Fi settings deployment
- **Certificate Deployment:** PKI certificates for network authentication

## Security Best Practices

### Device Management - Security

1. **Require Device Enrollment**
   - Enforce Conditional Access requiring compliant devices
   - Block unmanaged devices from accessing M365 resources

2. **Implement Compliance Policies**
   - Define minimum OS versions
   - Require encryption on all devices
   - Enforce password complexity
   - Block jailbroken/rooted devices

3. **Use App Protection Policies**
   - Prevent copy/paste to unmanaged apps
   - Require app PIN in addition to device PIN
   - Wipe corporate data on non-compliant devices

4. **Enable Conditional Access**
   - Require compliant device for Exchange Online
   - Require compliant device for SharePoint Online
   - Require approved apps for mobile access

### Data Protection

- **Selective Wipe:** Remove only corporate data when device is retired
- **Remote Wipe:** Full device wipe for lost/stolen devices
- **App Data Encryption:** Enforce encryption in app protection policies
- **Data Loss Prevention:** Prevent data transfer to personal apps

## Troubleshooting

### Common Issues

**Device Not Enrolling:**

- Check user has Intune license assigned
- Verify device meets minimum OS requirements
- Ensure device is Azure AD joined or registered
- Review enrollment restrictions

**App Deployment Failing:**

- Check assignment targets (user vs device group)
- Verify app platform matches device platform
- Review app installation logs on device
- Check network connectivity to Intune service

**Compliance Policy Not Applying:**

- Verify policy assigned to correct group
- Check for conflicting policies
- Allow 8 hours for initial policy sync
- Force sync from Company Portal app

### Support Resources

**Microsoft Documentation:**

- [Intune Documentation](https://learn.microsoft.com/en-us/mem/intune/)
- [Intune Troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/mem/intune/)
- [GCC High/DoD Intune Endpoints](https://learn.microsoft.com/en-us/mem/intune/fundamentals/intune-us-government-endpoints)

**Internal Support:**

- **IT Administrator:** Platform Owner (<platform-owner-email>)
- **ISC Manager:** Role Owner (<role-owner-email>)

**Microsoft Support:**

- Submit ticket via: Microsoft Intune admin center → Support → New support request
- Phone: 1-<support-phone> (M365 GCC support)

## Related Documentation

- [M365 Licensing](m365-licensing.md) - Intune license details
- [M365 API Access](m365-api-access.md) - Graph API configuration
- [Azure Active Directory](azure-ad.md) - Device registration and Conditional Access
- [CJIS Compliance](../../policies/cjis/cjis-policy.md) - Security policy requirements

## TODO Items

The following information needs to be documented:

- [ ] Current number of enrolled devices by platform
- [ ] List of deployed configuration profiles
- [ ] Active compliance policies
- [ ] Deployed applications inventory
- [ ] Conditional Access policies using Intune compliance
- [ ] Integration with Apple Business Manager (if configured)
- [ ] Android Enterprise binding (if configured)
- [ ] Windows Autopilot deployment profiles
- [ ] App protection policies in use
- [ ] Intune administrator accounts and roles

---

**Last Updated:** January 28, 2026  
**Next Review:** February 2026  
**Status:** Initial documentation - requires environment survey
