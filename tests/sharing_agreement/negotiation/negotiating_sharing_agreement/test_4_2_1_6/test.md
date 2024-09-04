
## [4.2.1.6] Sharing agreement: Negotiation - Negotiating sharing agreement
 
### Test description
Validate that the data sharing protocol is compatible with channel encryption (e.g. TLS), that a connector authentication has taken place exclusively for the data sharing negotiation.
 
### Test type
Test
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                                                                                | **Scoring**      |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| **No Coverage:** The solution fails to meet any of the specified technical requirements. It is not compatible with essential security protocols such as channel encryption (e.g., TLS), and no connector authentication has been implemented for data-sharing negotiations. The solution is completely inadequate for secure and effective operation. | 0                |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. It offers very basic functionality, with significant limitations. Some minimal security measures might be in place, but critical features like connector authentication or comprehensive encryption are largely absent or inadequately implemented. | 1                |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. While it includes some important features and may partially support security protocols and authentication processes, there are still substantial gaps that limit its overall effectiveness and reliability. | 2                |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. It demonstrates a strong alignment with the desired technical criteria, including robust support for channel encryption and authentication mechanisms, though there may be minor areas where further improvement is needed. | 3                |
| **Full Coverage:** The solution fully meets all specified technical requirements. It provides comprehensive support for all key features, including complete compatibility with channel encryption protocols (e.g., TLS) and effective connector authentication for secure data-sharing negotiations. There are no significant gaps, making the solution highly suitable for deployment. | 4                |

### Extra information
#### ISO25010 Quality
Security
#### ISO25010 Quality description
[Confidentiality] The data sharing agreement exchanges use an encrypted channel, the two parties have mutually authenticated, and the information of the negotiation is only visible to authorized users of the data producer and data consumer connectors
    