
## [2.1.3.2] Data product publication: Provision - Reuse or create usage control policies / functions

### Test description
Assess how Usage Control Policies are deployed. Rank the result by GUI coverage and ease of use (i.e. autocompletion, validation, interface to the policy repository is available, etc.)

### Test type
Assessment

### Execution phase
Phase 1

### Minimal?
Yes

### Extra information

#### ISO25010 Quality
Functional suitability

#### ISO25010 Quality description
The data producer uses a GUI to deploy and configure usage control policies + part of 6

### Evaluation criteria
The test needs to assign a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| Criteria                                                                                                                                                                                                                                                                      | Scoring |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| **No Coverage:** The technical requirements are unmet. The solution provides no support for adding or managing usage control policies.                                                                                                                                        | 0       |
| **Minimal Coverage:** Up to 25% of the technical requirements are met. The solution offers the basis for support for policy enforcement that can be implemented through a deep integration and custom development.                                                            | 1       |
| **Partial Coverage:** Around 50% of the technical requirements are met. The solution offers an interface to manage policies, but with gaps and inconsistencies remain.                                                                                                        | 2       |
| **Significant Coverage:** Approximately 80% of the technical requirements are met. The solution offers an interface for management and enforcement of policies, though minor gaps may exist.                                                                                  | 3       |
| **Full Coverage:** All technical requirements are fully met. The solution provides comprehensive and robust interface for creating, managing and enforcing policies, including standard ODRL templates covering the complete lifecycle of the agreement and transfer process. | 4       |
