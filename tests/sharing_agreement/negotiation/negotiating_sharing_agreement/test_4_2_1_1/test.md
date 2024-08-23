
## [4.2.1.1] Sharing agreement: Negotiation - Negotiating sharing agreement
 
### Test description
Test completeness: Two connectors can negotiate a data sharing agreement that supports a defined minimal state machine (the definition of the minimal state machine must be agreed beforehand).
 
### Test type
Test
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                                      | **Scoring** |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| **No Coverage:** The solution fails to implement any negotiation flow for the data sharing agreement based on the defined minimal state machine.                                                                                                    | 0           |
| **Minimal Coverage:** The solution meets up to 25% of the technical requirements. This might include only a basic framework for the negotiation flow, with a significant part of the defined minimal state machine not implemented. | 1           |
| **Partial Coverage:** The solution satisfies approximately 50% of the technical requirements. This could involve a partially implemented negotiation flow for the data sharing agreement based on the defined minimal state machine, with several key elements missing or incomplete.                                                       | 2           |
| **Significant Coverage:** The solution covers about 80% of the technical requirements. This includes a well-implemented negotiation flow for the data sharing agreement based on the defined minimal state machine, with only minor elements or details that may still need refinement.         | 3           |
| **Full Coverage:** The solution fully meets all technical requirements. This includes a fully implemented negotiation flow for the data sharing agreement based on the defined minimal state machine, with all elements thoroughly addressed and tested.                                                                                                                                                                                                 | 4           |

### Extra information
#### ISO25010 Quality
Interoperability
#### ISO25010 Quality description
The system provides components that negotiate a data sharing agreement through a common protocol. The data sharing protocol implements requests, responses, and states that produce an iterative data sharing negotiation which is semantically interpretable by an observer.
    