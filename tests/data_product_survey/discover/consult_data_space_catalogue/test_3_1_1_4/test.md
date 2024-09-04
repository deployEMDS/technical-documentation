
## [3.1.1.4] Data product survey: Discover - Consult data space catalogue

### Test description
Assessment: either the data product specification provides the necessary metadata to report quality, or the catalogue must be extended with an “-AP” profile. Ranks higher in the first case.

### Test type
Assessment

### Execution phase
Phase 1

### Minimal?
No

### Comparative criteria (checklists, ...)

| **Criteria** | **Scoring** |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| **No DCAT-AP Support:** The implementation does not allow any DCAT-AP profile or functionality. | 0           |
| **Breaks with Napcore DCAT-AP:** The implementation breaks if Napcore's DCAT-AP is used to describe data products. | 1           |
| **Ignores Extensions but Functional:** The implementation ignores the extensions of Napcore's DCAT-AP, but the system works as expected, with extended metadata retrievable as part of the distribution. | 2           |
| **Partial Integration:** The implementation integrates Napcore's DCAT-AP profile and utilizes it for some search and listing functionalities, but with limitations. | 3           |
| **Full Integration:** The implementation fully integrates Napcore's DCAT-AP profile and utilizes it effectively for search and listing functionalities. | 4           |

### Extra information
#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
The catalogue maintains updated quality metrics about the different data products.
    