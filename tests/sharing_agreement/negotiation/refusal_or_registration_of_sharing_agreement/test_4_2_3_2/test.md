
## [4.2.3.2] Sharing agreement: Negotiation - Refusal or registration of sharing agreement
 
### Test description
Check whether the system provides a observability trace of the sharing agreement (privacy terms of observability are out of scope here).
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The evaluation for this test case uses the following matrix:

| Criteria                                                                                                                                | Scoring |
|-----------------------------------------------------------------------------------------------------------------------------------------|---------|
| No traceability.                                                                                                                        | 0       |
| System logs, which record only a connection between two connectors using non-data space identifiers such as a public URL or IP address. | 1       |
| Application logs that include process information, for example, "Connector control plane initiating on port...".                        | 2       |
| Data space protocol status traces, such as "Data sharing agreement request".                                                            | 3       |
| Data space protocol transaction traces, for instance, "Contract ID Op: negotiation".                                                    | 4       |
| A complete data space protocol context dump, including the entire JSON dump with references.                                            | 5       |

### Extra information
#### ISO25010 Quality
Security
#### ISO25010 Quality description
[Integrity] The system provides observability records of the sharing agreement states (privacy terms of observability are out of scope here).
    