

# Policy Publication Standard Operating Procedure (SOP)

## 1. Purpose

This Policy Publication Standard Operating Procedure (SOP) establishes a formal, controlled process for publishing organization policy and procedure documents for organizational access while preserving a single authoritative source of truth.

This SOP ensures that:
- Policies are version-controlled and auditable
- Staff access current, approved documentation
- Unauthorized or informal edits are prevented
- CJIS, DOJ, and organization audit requirements are supported

## 2. Scope

This SOP applies to all organization policies, standards, procedures, and governance documents intended for organizational reference, including but not limited to:
- CJIS-related policies
- Information Sharing & Dissemination (ISC) procedures
- IT governance and operational documentation

This SOP does **not** govern the creation or approval of policy content, only its publication and distribution.

## 3. Authoritative Source of Policy Documents

### 3.1 Source of Truth

The authoritative source for all organization policy documentation is the private GitHub repository:

**Central-Florida-HIDTA/Documentation**

All policy authoring, revisions, and version history are maintained exclusively within this repository.

### 3.2 Non-Authoritative Copies

Any copies of policy documents published outside of the GitHub repository (including SharePoint or PDF exports) are considered **read-only reference copies** and shall not be edited directly.

## 4. Publication Platform

### 4.1 Distribution Platform

Approved policy publications are distributed via a SharePoint document library synchronized through OneDrive for organizational access.

This platform is used solely for:
- Policy visibility
- Controlled access
- Retention and discovery

### 4.2 Access Controls

- Published policy documents are read-only
- Editing permissions are restricted
- Version overwrite and deletion are controlled by IT

## 5. Publication Process

### 5.1 Publication Method

Policies are published using a controlled, locally executed publication script operated by the IT Manager or designated administrator.

The publication process includes:
- Rendering Markdown source documents into non-editable formats (e.g., PDF)
- Preserving folder structure alignment with the authoritative repository
- Injecting publication metadata

### 5.2 Trigger for Publication

Publication occurs when:
- A policy document is finalized and approved
- The IT Manager initiates the publication process
- The document is ready for organizational reference

Draft or in-progress documents are not published.

## 6. Versioning & Metadata

Each published policy artifact includes metadata identifying:
- Document title
- Publication date
- Source repository
- Git commit identifier
- Read-only status notice

Version history is preserved within the authoritative repository and is not managed in SharePoint.

## 7. Change Control

### 7.1 Policy Updates

All policy changes must be:
- Authored and approved within the authoritative repository
- Reviewed according to applicable governance processes
- Re-published following approval

Direct edits to published copies are prohibited.

### 7.2 Superseded Documents

When a policy is updated:
- The newly published version replaces the prior reference copy
- Historical versions remain available in the authoritative repository
- Superseded versions may be archived in SharePoint if required for audit purposes

## 8. Responsibilities

### 8.1 IT Manager

The IT Manager is responsible for:
- Maintaining the authoritative policy repository
- Executing the publication process
- Ensuring published documents reflect approved versions
- Maintaining publication tooling and access controls

### 8.2 organization Leadership

organization leadership is responsible for:
- Policy approval and authority
- Ensuring staff awareness of official policy locations

### 8.3 Staff

organization staff are responsible for:
- Referencing published policies for guidance
- Reporting discrepancies or access issues
- Refraining from maintaining unofficial policy copies

## 9. Audit & Compliance

This publication model supports:
- CJIS Security Policy requirements
- DOJ and organization governance expectations
- Evidence of controlled document management
- Demonstration of version integrity and traceability

Audit requests for historical versions or approval records shall be satisfied using the authoritative repository.

## 10. Review & Maintenance

This SOP shall be:
- Reviewed annually
- Updated following significant process or tooling changes
- Maintained by the IT Manager

---

**Document Owner:** IT Manager, Central Florida HIDTA  
**Classification:** Internal Use  
**Effective Date:** Upon approval