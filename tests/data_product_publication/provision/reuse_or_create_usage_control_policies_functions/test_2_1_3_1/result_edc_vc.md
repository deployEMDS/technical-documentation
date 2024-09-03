## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.

### Results

#### Measured results

Let `C` be the number of sharing agreements that are referencing a given policy.

| Action                                       | **Functional Completeness** | **Functional Correctness** | **Functional Appropriateness** | Explanation                                                   |
|----------------------------------------------|-----------------------------|----------------------------|--------------------------------|---------------------------------------------------------------|
| Create a new policy                          | 4/4                         |  4/4                       | 4/4                            |                                                               |
| Assign a usage policy to a sharing agreement |  4/4                            |  4/4                           | 4/4                            |                                                               |
| Delete a sharing agreement                   |    4/4                          |   4/4                          | 4/4                            |                                                               |
| Delete a usage policy                        |     4/4                         |    4/4                         | 4/4 (C+1)                      | Each sharing agreement must be deleted first                  |
| Update existing sharing agreement            |       4/4                       |    4/4                         | 2/4                            | No update available, requires 1 deletion and 1 creation       |
| Update existing policy                       |    4/4                          |    4/4                         | 4/4                            |                                                               |
| Extend the usage policy language             |  4/4                            |   4/4                          | 1/4                            |                                                               |
| Create new policy enforcement functions      |  4/4                            |   4/4                          | 1/4                            |                                                               |

The APIs cover the most fundamental policy actions.
Actions that modify existing objects might be restricted by integrity constraints (e.g. prevent a situation where a sharing agreement is referencing some non-existing policy), increasing the number of calls required to complete the action.

However, implementing actions beyond this basic set demands significant technical effort.
This effort involves not only the capability to implement and deploy custom functions (see [Test 2.2.2.4](https://github.com/imec-int/deployEMDS/issues/194)) but also a comprehensive understanding of the standards governing the policy language (see [Test 2.2.2.10](https://github.com/imec-int/deployEMDS/issues/206)).

Functional Suitability Quality Metric Score: 3/4
