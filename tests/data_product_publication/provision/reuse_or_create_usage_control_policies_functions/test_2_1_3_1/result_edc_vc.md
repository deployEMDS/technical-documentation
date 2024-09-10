## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.

### Results
#### Assessment
The APIs cover the most fundamental policy actions.
Actions that modify existing objects might be restricted by integrity constraints (e.g. prevent a situation where a sharing agreement is referencing some non-existing policy), increasing the number of calls required to complete the action.

However, implementing actions beyond this basic set demands significant technical effort.
This effort involves not only the capability to implement and deploy custom functions (see [Test 2.2.2.4](https://github.com/imec-int/deployEMDS/issues/194)) but also a comprehensive understanding of the standards governing the policy language (see [Test 2.2.2.10](https://github.com/imec-int/deployEMDS/issues/206)).

#### Measured results

The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability. Individual scores per action are detailed in the table below, as some actions received different scores according to the defined criteria.

| Action                                       | **Functional Completeness** | **Functional Correctness** | **Functional Appropriateness** | Explanation                                                   |
|----------------------------------------------|-----------------------------|----------------------------|--------------------------------|---------------------------------------------------------------|
| Create a new policy                          | 4                         |  4                       | 4                            |                                                               |
| Assign a usage policy to a sharing agreement |  4                            |  4                           | 4                            |                                                               |
| Delete a sharing agreement                   |    4                          |   4                          | 4                            |                                                               |
| Delete a usage policy                        |     4                         |    4                         | 2                      | Requires `C+1` API calls where `C` is the number of sharing agreements that reference the given policy (i.e., each sharing agreement must be deleted first)                  |
| Update existing sharing agreement            |       4                       |    4                         | 3                            | No update available, requires 1 deletion and 1 creation       |
| Update existing policy                       |    4                          |    4                         | 4                            |                                                               |
| Extend the usage policy language             |  1                            |   1                          | 1                            | Requires both API calls and manual deployment of new implementation files.                                                              |
| Create new policy enforcement functions      |  1                            |   1                          | 1                            | Requires both API calls and manual deployment of new implementation files                                                              |
| **Overall**      |  **(4 * 6 + 1 * 2) / 8 = 3.25**                            |   **(4 * 6 + 1 * 2) / 8 = 3.25**                          | **(4 * 4 + 3 + 2 + 1 * 2) / 8 = 2.875**                            |                                       |

Overall score calculation: (3.25 + 3.25 + 2.875) / 3 = 3.125

**Functional Suitability Quality Metric Score: 3.125**
