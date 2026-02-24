# Central Florida HIDTA – IT Manager Sitebook  

## 1. Purpose of This Sitebook  
This IT Manager Sitebook serves as a centralized operational, technical, and governance reference for the Central Florida HIDTA. It is designed to support:  
- Continuity of operations  
- CJIS compliance  
- Security audits  
- Incident response  
- Day‑to‑day IT management  

This document is intended for:  
- IT Manager / Systems Administrator  
- Authorized organization leadership  
- Auditors (CJIS, DOJ, internal)  
- Designated incident response personnel  

## 2. Organizational Overview  

### 2.1 Agency Mission  
Central Florida HIDTA supports federal, state, local, and tribal law‑enforcement agencies in disrupting and dismantling drug trafficking organizations through intelligence sharing, operational coordination, and technology enablement.  

### 2.2 IT Program Objectives  
- Maintain secure, reliable, CJIS‑compliant IT systems  
- Support investigative and intelligence operations  
- Protect sensitive law‑enforcement data  
- Enable rapid incident response and recovery  

## 3. Governance & Compliance  

### 3.1 Regulatory Framework  
- CJIS Security Policy (current version)  
- organizational Program Requirements  
- NIST SP 800‑53 and SP 800‑61 (guidance)  
- State of Florida data protection requirements  

### 3.2 Policies Maintained  
- Acceptable Use Policy (AUP)  
- Access Control Policy  
- Incident Response Plan (IRP)  
- Disaster Recovery / Business Continuity Plan  
- Change Management Policy  
- Data Classification & Handling Policy  

*Note: Policies are stored in the official organization policy repository and reviewed annually.*  

### 3.3 Policy Publication & Distribution

organization policy documents are authored, maintained, and version-controlled within the official organization policy repository. Distribution of policies for organizational access is governed by the **Policy Publication Standard Operating Procedure (SOP)**.

Key principles include:
- A single authoritative source of truth for all policy documents
- Controlled, read-only publication of approved policies for staff access
- Separation of policy authoring/approval from publication and distribution
- Traceable version history and audit-ready documentation handling

Refer to **Policy Publication SOP** for detailed procedures governing how policies are rendered, published, and made available to organization personnel.

## 4. IT Environment Overview  

### 4.1 Identity & Access Management  
- Microsoft Entra ID (Azure AD) with cloud‑only identities  
- Role‑Based Access Control (RBAC)  
- Privileged Identity Management (PIM)  
- Dedicated Privileged Access Accounts  

### 4.2 Device Management  
- Microsoft Intune (MDM/MAM)  
- Primary platform: Windows 10/11; macOS limited/approved use  
- All devices are encrypted (BitLocker or FileVault), cloud‑joined, and onboarded to Defender for Endpoint  

### 4.3 Security Tooling  
- Microsoft Defender for Endpoint  
- Microsoft Defender for Office 365  
- Conditional Access Policies  
- Multi‑Factor Authentication (FIDO2/Authenticator preferred)  

### 4.4 Networking (High-Level)  
- Meraki MX security appliances  
- Segmented VLANs  
- Site‑to‑site VPN as applicable  
- CJIS‑compliant firewall configurations  

## 5. User Lifecycle Management  

### 5.1 Onboarding  
- Account creation in Entra ID  
- Mandatory MFA enrollment before access  
- Device enrollment via Intune  
- Least‑privilege role assignment  
- Security awareness acknowledgement  

### 5.2 Offboarding  
- Immediate account disablement  
- Token/session revocation  
- Device wipe or reclaim  
- Access review verification  
- Documentation of completion  

### 5.3 Access Reviews  
- Quarterly access reviews for privileged roles  
- Quarterly reviews of CJIS‑accessing accounts  
- Quarterly reviews of external/partner users  

## 6. Privileged Access Management  

### 6.1 Privileged Accounts  
- Separate admin accounts are required  
- No email or daily‑use activities permitted on privileged accounts  
- Privileged Identity Management (PIM) with approval and just‑in‑time access  

*(Additional sections can be expanded based on the rest of the sitebook, such as monitoring, logging, and incident response procedures.)*
