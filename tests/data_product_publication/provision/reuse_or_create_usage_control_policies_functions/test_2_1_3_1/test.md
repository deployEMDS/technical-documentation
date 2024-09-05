
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
Yes
 
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

  Description | Scoring
-- | --
The action cannot be executed via API calls | 0
The action can be partially executed via API calls, but still requires manual code or configuration updates  | 1
The action can be fully executed via API calls, but requires more than 4 API calls | 2
The action can be fully executed with 2 - 3 API calls | 3
The action can be fully executed with a single API call | 4
