
## [3.1.1.1] Data product survey: Discover - Consult data space catalogue
 
### Test description
Assessment: If an Online U/X is natively available, evaluate individual search features. If the Data space catalogue exposes an API, assess the technical debt to integrate it with a data search tool that is representative for EU projects. Criteria are: Open Source, hosted solution or EU-driven project.
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                                        | **Scoring** |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| **No Coverage:** The solution fails to provide a native online user experience (U/X), exposes no search features, and does not offer any integration with open-source solutions, hosted solutions, or EU-driven projects.                                                                                                    | 0           |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. This might include a basic online user interface with limited functionality, minimal search features, or an API that is available but requires significant technical effort to integrate with any of the three types of solutions: open-source, hosted, or EU-driven projects. | 1           |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. This could involve a functional online user experience with some search features and an API that supports integration with at least one of the three types of solutions (open-source, hosted, or EU-driven projects) but requires moderate effort. | 2           |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. This includes a well-developed online user experience with comprehensive search features, and an API that is well-documented and supports integration with two of the three types of solutions with minimal technical effort.         | 3           |
| **Full Coverage:** The solution fully meets all evaluation criteria. This includes a fully developed native online user experience with advanced search features, and an API that seamlessly integrates with all three types of solutions (open-source, hosted, and EU-driven projects) with minimal or no technical effort. | 4           |

### Extra information
#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
The catalogue system provides human or interactive interfaces to perform complex and free-text searches across data products. 
    