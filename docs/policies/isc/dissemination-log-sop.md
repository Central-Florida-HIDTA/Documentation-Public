## ISC Criminal History Dissemination Log SOP

### Purpose
The purpose of this SOP is to define the standardized process for recording all dissemination of criminal history and other CJIS‑regulated information by the Investigative Support Center (ISC).  A centralized log ensures CJIS compliance, provides a clear audit trail, and eliminates the inconsistent Word‑based templates previously used by analysts.

### Scope
This procedure applies to **all analysts** within the ISC and to any other staff who disseminate criminal history information under the Center’s purview.  The process covers routine criminal history requests, intelligence analyses, officer safety notifications, and judicial or administrative inquiries.

### System of Record
1.  **ISC Dissemination Log** – A SharePoint List hosted within the ISC Team in Microsoft Teams (also available via a direct web browser).  This list replaces all individual Word templates for dissemination logging.
2.  Each dissemination entry is a single list item.  System‑generated metadata (`Created` and `Created By`) are automatically recorded to track who submitted the entry and when.
3.  Version history is enabled and deletion is prohibited for analysts.  Supervisors may correct entries but all changes are retained.

### Required Fields
When creating a new dissemination record, analysts **must** complete the following fields.  Drop‑down values are used where possible to ensure data integrity.

| Field                     | Description                                       | Notes                                   |
|--------------------------|---------------------------------------------------|-----------------------------------------|
| **Dissemination Date**   | Date the information was disseminated             | Defaults to the current date            |
| **Subject Name**         | Name of the individual whose record was released  | Required                                 |
| **SID/FBI Number**       | State ID or FBI number of the subject             | Required                                 |
| **Requester Name**       | Person receiving the information                  | Required                                 |
| **Requester Agency**     | Agency affiliation (e.g., Local, State, Federal)  | Choice field                             |
| **Analyst**              | Person performing the dissemination               | Auto‑populated to the current user      |
| **Case Number**          | Case or reference number associated with request  | Required                                 |
| **Reason for Dissemination** | Purpose for release (e.g., Investigation, Officer Safety, Judicial Proceeding) | Choice field |
| **Purpose Code**         | CJIS purpose code (state‑defined list)           | Choice field                             |
| **Purpose/Notes**        | Additional context or notes                       | Optional                                 |

### Procedure
1.  Navigate to the **ISC – Criminal History Dissemination Log** tab in the ISC Team (Teams) or open the list directly in a web browser.
2.  Select **New** to create a new entry.  Complete all required fields as outlined above.  Use the drop‑down lists for `Requester Agency`, `Reason for Dissemination`, and `Purpose Code` to ensure consistent values.
3.  **Submit the entry on the same business day** as the dissemination.  Late entries must be explained in the `Purpose/Notes` field.
4.  Once saved, entries are generally not editable by analysts.  If corrections are needed, notify your supervisor; supervisors may update entries, but all changes are preserved in version history.
5.  Do **not** delete entries.  Deletion is restricted and should never be used to remove records.

### Compliance and Audits
- CJIS policy requires that all disseminations of criminal history be documented.  The centralized log provides a defensible audit trail for internal review and external audits.
- The ISC manager (or designee) will conduct **periodic spot audits** of CJIS records to verify proper use of the dissemination log and adherence to the procedure.  Analysts may be asked to account for unlogged disseminations.
- Non‑compliance with this SOP may result in disciplinary action and will be reported to organization leadership and the CJIS compliance officer.

### Roles and Responsibilities
- **Analysts** – Responsible for logging each dissemination promptly and accurately in the ISC Dissemination Log.
- **Supervisors/Managers** – Ensure analysts understand and comply with this SOP; approve any corrections to existing entries; conduct routine checks for completeness.
- **Auditors/Compliance Officers** – Have read‑only access to the log and may review version history and metadata during audits.

### Related Documentation
This SOP is part of the ISC Operations documentation and should be referenced by the **ISC/Intelligence Operations SOP** and **CJIS Policy & Procedures**.  It should **not** be included in the IT Manager’s Handbook or the Incident Response Plan, as dissemination logging is an operational requirement rather than an IT process or incident response activity.

### Effective Date and Revision History
- **Effective Date:** January 2026
- **Revision 1.0:** Initial adoption of centralized dissemination log.
- **Revision 1.1:** Updated SOP to reflect management approval, mandatory usage, and periodic spot audits (January 2026).