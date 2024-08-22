## [1.3.1.1A] Participant onboarding: Certification - Identity and credentials issuance

### Test description

Prove that the stack uses a credential framework that is compatible with this initiative: Gaia-X

### Test type

Test

### Execution phase

Phase 1

### Minimal?

Yes

### Comparative criteria

The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                                      | **Scoring** |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| **No Coverage:** The solution fails to meet any of the specified technical requirements. This indicates a complete lack of implementation concerning the requirements. The solution does not support using, issuing or validating verifiable credentials.                                                                                                                                         | 0           |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. The solution has minimal support for verifiable credentials. For example, a credential will be accepted and its signature checked. However, significant gaps exist, such as lack of compatibility with different credential types, no support for SD classes or integration with external trust intermediaries. | 1           |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. The solution supports self-issued credentials with support for SD classes. The solution supports a GAIA-X compatible DID method but without any compliance or claim verification.                                                                                                                   | 2           |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. Most key functionalities are implemented effectively. The solution supports and uses GAIA-X trust anchors. The stack has a service that verifies credential compliance and a connector has policies to ensure a participant has compliant GAIA-X descriptors.                                              | 3           |
| **Full Coverage:** The solution fully meets all technical requirements, the stack implements policies that can use SD classes to interpret claims and use a GXDCH clearing house for business purposes.                                                                                                                                                                                           | 4           |

### Extra information

#### ISO25010 Quality

Functional suitability

#### ISO25010 Quality description

[Completeness] The credential framework supports attestations and (multiple?) trust anchors.
