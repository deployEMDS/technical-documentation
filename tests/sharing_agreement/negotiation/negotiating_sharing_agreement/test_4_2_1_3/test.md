
## [4.2.1.3A] Sharing agreement: Negotiation - Negotiating sharing agreement
 
### Test description
Prove that the negotiation can use (one or more of) the following assets and parameters to define a contract:
- Claim verification
- Usage policy rules
- Service Agreements

The larger the coverage (i.e. more possibilities), the higher the rank.
 
### Test type
Test
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria** | **Scoring** |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| **No Proof:** The solution does not demonstrate the ability to use any of the specified assets or parameters (Claim Verification, Usage Policy Rules, Service Agreements) in the negotiation process to define a contract. | 0           |
| **Limited Proof:** The solution demonstrates the ability to use only one of the specified assets or parameters in the negotiation process to define a contract. | 1           |
| **Moderate Proof:** The solution demonstrates the ability to use two of the specified assets or parameters in the negotiation process to define a contract. | 2           |
| **Extensive Proof:** The solution demonstrates the ability to use all three specified assets or parameters in the negotiation process to define a contract, though with some limitations in coverage or flexibility. | 3           |
| **Comprehensive Proof:** The solution fully demonstrates the ability to use all three specified assets or parameters (Claim Verification, Usage Policy Rules, Service Agreements) in a flexible and comprehensive negotiation process, effectively covering a wide range of possibilities to define and manage contracts. | 4           |

### Extra information
#### ISO25010 Quality
Functional completeness
#### ISO25010 Quality description
The protocol implements negotiation based on claims, usage policies, and business service descriptors.
    