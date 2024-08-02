## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.

#### Tested quality metric and method

We rank the ease of use of the API by scoring the following actions
1. Create a new policy
2. Assign a usage policy to a sharing agreement
3. Delete a sharing agreement
4. Delete a usage policy
5. Update existing sharing agreement
6. Update existing usage policy
7. Extend the usage policy language
7. Create new policy enforcement functions

The score will be as follows
- -1 if the action can't be executed via APIs
- 1/N if the action can be executed with N calls

### Results

#### Measured results

Let `C` be the number of sharing agreements that are referencing a given policy.

| Action                                       | Score   | Notes                                                   |
|----------------------------------------------|---------|---------------------------------------------------------|
| Create a new policy                          | 1       |                                                         |
| Assign a usage policy to a sharing agreement | 1       |                                                         |
| Delete a sharing agreement                   | 1       |                                                         |
| Delete a usage policy                        | 1/(C+1) | Each sharing agreements must be deleted first           |
| Update existing sharing agreement            | 1/2     | No update available, requires 1 deletion and 1 creation |
| Update existing policy                       | 1       |                                                         |
| Extend the usage policy language             | -1      |                                                         |
| Create new policy enforcement functions      | -1      |                                                         |

The APIs cover the most fundamental policy actions.
Actions that modify existing objects might be restricted by integrity constraints (e.g. prevent a situation where a sharing agreement is referencing some non-existing policy), increasing the number of calls required to complete the action.

However, implementing actions beyond this basic set demands significant technical effort.
This effort involves not only the capability to implement and deploy custom functions (see [Test 2.2.2.4](https://github.com/imec-int/deployEMDS/issues/194)) but also a comprehensive understanding of the standards governing the policy language (see [Test 2.2.2.10](https://github.com/imec-int/deployEMDS/issues/206)).

Functional Suitability Quality Metric Score: 2
