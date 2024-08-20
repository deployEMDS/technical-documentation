
## [4.2.1.7] Sharing agreement: Negotiation - Negotiating sharing agreement
 
### Test description
Verify that the system outputs logs detailing the sharing agreement process. Rank higher if the logs provide business information under a standard format.  
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
No
 
### Evaluation criteria
The test needs to assign a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| Criteria           | Scoring          |
| ------------------- | ---------------- |
| **No Coverage:** The technical requirements are unmet. The solution provides no logging for the sharing agreement process, leaving it untraceable and unauditable. | 0 |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. Basic logging exists but lacks detail, making the process difficult to follow or troubleshoot. | 1 |
| **Partial Coverage:** Around 50% of the technical requirements are met. The solution logs some aspects of the sharing agreement process, but gaps and inconsistencies remain. | 2 |
| **Significant Coverage:** Approximately 80% of the technical requirements are met. The solution logs most aspects of the sharing agreement process, with good traceability, though minor gaps may exist. | 3 |
| **Full Coverage:** All technical requirements are fully met. The solution provides comprehensive, detailed, and standardized logging for the entire sharing agreement process, ensuring complete traceability and easy integration with other tools. | 4 |
### Extra information
#### ISO25010 Quality
Security
#### ISO25010 Quality description
[Integrity] The system provides observability records of the sharing agreement states (privacy terms of observability are out of scope here).
    