
## [2.1.3.1] Data product publication: Provision - Reuse or create usage control policies / functions
 
### Test description
Assess how Usage Control Policies are deployed. Rank the result by API coverage and ease of use (i.e. avoiding multiple calls with parameter passing) by scoring the following actions

1. Create a new policy
2. Assign a usage policy to a sharing agreement
3. Delete a sharing agreement
4. Delete a usage policy
5. Update existing sharing agreement
6. Update existing usage policy
7. Extend the usage policy language
7. Create new policy enforcement functions
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
No
 
### Extra information
#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
The data producer uses an API to deploy and configure usage control policies.

### Evaluation Criteria 
The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.


| **Criterion**                | **Description**                                                                                     | **Score (0-4)** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives. The scores reflects the number of actions that can be executed.                          | -              |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision. The scores reflects the number of actions that are correctly executed.                          | -              |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives. The score decreases by the number of API calls required to complete an action.           | -              |

In order to assign a score between 0 and 4, the following metric was used by calculating the number of API calls that are needed to execute each of the actions included in the test.

The score will be as follows
- 0 if the action can't be executed via APIs
- 1/N if the action can be executed with `N` API calls
