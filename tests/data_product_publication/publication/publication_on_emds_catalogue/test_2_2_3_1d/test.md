
## [2.2.3.1D] Data product publication: Publication - Publication on EMDS catalogue
 
### Test description
Test the process of catalogue publication for a data product under the following conditions: a data product is de-published.
 
### Test type
Test
 
### Execution phase
Phase 1
 
### Minimal?
Yes

### Comparative criteria (checklists, ...)
The test assigns a numeric score based on the assessment, using the Functional Suitability metric from [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

| **Criteria**                                                                                                                                                                                                                                                                                                                                                                              | **Scoring** |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| **No Coverage:** The solution does not provide any functionality for de-publishing a data product from the catalog. Users cannot remove or hide a data product once it is published, and achieving this requires extensive custom development or workarounds.                                                                                                 | 0           |
| **Minimal Coverage:** The solution meets up to 25% of the evaluation criteria. It may offer basic de-publication functionality, but this is not fully operational out of the box and requires significant technical effort or development to implement. The process is cumbersome and not intuitive for end users. | 1           |
| **Partial Coverage:** The solution satisfies approximately 50% of the evaluation criteria. It allows for de-publishing of data products but requires some degree of customization or development to function correctly. Additionally, the process may be partially intuitive but could still pose challenges for end users in terms of usability. | 2           |
| **Significant Coverage:** The solution covers about 80% of the evaluation criteria. It provides effective de-publication functionality with minimal development required. The de-publication process is mostly intuitive and user-friendly, with only minor usability issues or adjustments needed. | 3           |
| **Full Coverage:** The solution fully meets all evaluation criteria. It offers complete, out-of-the-box functionality for de-publishing a data product, allowing users to easily remove or hide a data product from the catalog. The process is straightforward, intuitive, and requires no additional development or technical modifications. | 4           |


### Extra information
#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
The data producer can, at any time, make a data product visible in the data space catalogue(s).
    