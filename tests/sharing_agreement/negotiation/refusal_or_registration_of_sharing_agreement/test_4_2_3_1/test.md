
## [4.2.3.1] Sharing agreement: Negotiation - Refusal or registration of sharing agreement
 
### Test description
Check whether the negotiation API, or the status messages, or the negotiation logs, are not accessible to entities other than the negotiating participants and the system admin (privileged role).
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                       | **Scoring**      |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| **No Coverage:** The solution fails to meet any of the specified technical requirements. This indicates a complete lack of implementation concerning the requirements. There is no functionality to manage negotiation APIs, status messages, or logs, or they are accessible by unauthorized users, compromising security.                                                                                      | 0                |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. Basic elements may be present, such as rudimentary access controls or a partial implementation of the negotiation API. However, significant gaps exist, such as missing or improperly secured status messages and logs, allowing unauthorized access, or only basic encryption without role differentiation.                                | 1                |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. The negotiation API is implemented with basic access control, but not all security measures are in place. For instance, status messages and logs might be accessible only to participants but not properly restricted from non-participating users or system admins. Encryption might be present but inconsistently applied.                        | 2                |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. Most key functionalities are implemented effectively. The negotiation API, status messages, and logs are generally restricted to negotiating participants and the system admin. However, there may be minor vulnerabilities or inconsistencies, such as edge cases where unauthorized access could occur or some roles are not clearly distinguished.  | 3                |
| **Full Coverage:** The solution fully meets all technical requirements, ensuring that the negotiation API, status messages, and negotiation logs are strictly accessible only to the negotiating participants and the system admin. The system admin role is fully defined and technically privileged, with no overlap with participant identities unless explicitly intended. Strong encryption and access controls are applied consistently.           | 4                |

### Extra information
#### ISO25010 Quality
Security
#### ISO25010 Quality description
[Confidentiality] The system ensures that confidential details of the agreement are only shared between authorized participants.
    