
## [2.2.3.4] Data product publication: Publication - Publication on EMDS catalogue
 
### Test description
Feature assessment: catalogue de-publishing or make the catalogue entry private.
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
No

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                                    | **Scoring** |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| **No Coverage:** The solution does not provide any functionality to de-publish a catalog entry or make a catalog entry private. Users have no means to change the visibility status of catalog entries, and implementing this capability would require extensive custom development that is not supported or feasible.                                                                                        | 0           |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. It may offer some limited or basic functionality to de-publish a catalog entry or make it private, but these features are not fully implemented out-of-the-box and require significant development or technical expertise to be functional. The process may be unintuitive and difficult for users to operate effectively. | 1           |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. It provides partial functionality to de-publish a catalog entry or make it private, but requires moderate customization or development to be fully operational. The feature is somewhat user-friendly but may still have some usability issues or complexities that impact ease of use for non-technical users.   | 2           |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. It offers nearly complete out-of-the-box functionality for de-publishing a catalog entry or making it private, with only minor development needed to refine the feature. The process is largely intuitive and accessible, with only a few minor enhancements needed to optimize the user experience.                | 3           |
| **Full Coverage:** The solution fully meets all evaluation criteria. It provides comprehensive, out-of-the-box functionality that allows users to easily de-publish a catalog entry or make it private. The feature is fully developed, intuitive, and user-friendly, requiring no additional development or technical adjustments to be effective.                                                                 | 4           |

### Extra information
#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
Can the data producer remove a data product offering from the EMDS catalogue?
    