## [2.2.2.4] Data product publication: Publication - Deploy/config usage control functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.

#### Tested quality metric and method

The system provides an API or libraries to embed custom usage enforcement functions that can be invoked by usage policies.

### Results
#### Assessment

As explained in [this sample](https://github.com/eclipse-edc/Samples/tree/main/policy/policy-01-policy-enforcement#policy-enforcement), the EDC connector does support custom usage enforcement functions.
This feature allows users to define and enforce their own specific policies regarding data usage. However, leveraging this advanced capability is not straightforward and involves a more intricate process.
Users must implement the custom usage enforcement functionality themselves, which entails writing and integrating code that defines the desired enforcement policies.
Additionally, once the custom functionality is developed, the EDC connector needs to be rebuilt to include this new extension.
This process requires a thorough understanding of the EDC connector’s architecture and extension mechanisms.

#### Measured results
The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.

| **Criterion**                | **Description**                                                                                     | **Score (0-4)** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 3               |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 4               |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 1               |

Overall score calculation: (3 + 4 + 1) / 3 = 3.17
**Functional Suitability Quality Metric Score: 2.67**
