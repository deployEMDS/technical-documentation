
## [2.2.3.1C] Data product publication: Publication - Publication on EMDS catalogue
 
### Test description
Test the process of catalogue publication for a data product under the following conditions: a new data product cannot be published on the catalogue
 
### Test type
Test
 
### Execution phase
Phase 1
 
### Minimal?
No

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                                | **Scoring** |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| **No Coverage:** The solution does not provide any functionality to control whether a new data product published on the connector is visible on the catalog. Users have no means to manage catalog visibility, and any customization or development to achieve this functionality is not supported or would be extremely difficult.                                                                                                  | 0           |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. It might provide some basic or rudimentary controls over catalog visibility, but the feature is not fully functional out of the box and requires significant development or technical expertise to be usable by end users. Users may struggle with usability or find the functionality unintuitive. | 1           |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. It offers some level of control over catalog visibility, but either requires moderate customization or development to make it fully functional, or the user interface and experience are only partially effective and could confuse or complicate the user's ability to manage visibility easily. | 2           |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. It provides a nearly complete out-of-the-box functionality that allows publishers to control catalog visibility with minimal development needed. The feature is mostly easy to use, with only minor adjustments or enhancements required to optimize user experience or functionality. | 3           |
| **Full Coverage:** The solution fully meets all evaluation criteria. It offers comprehensive, out-of-the-box functionality that allows publishers to easily control whether a new data product published on the connector is visible on the catalog. The feature is intuitive and user-friendly, requiring no additional development or technical adjustments. | 4           |

### Extra information
#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
The data producer can, at any time, make a data product visible in the data space catalogue(s).
    