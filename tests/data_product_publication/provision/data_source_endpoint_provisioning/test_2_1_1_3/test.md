
## [2.1.1.3] Data product publication: Provision - Data source endpoint provisioning
 
### Test description
Assess the availability of multiple data planes that support multiple protocols. Refer to D2.1 for an overview of the most used protocols. The higher the coverage, the higher the ranking.
 
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
Can the provider integrate different data source methods (APIs, data bases, file systems, etc.)

### Comparative criteria (checklists, ...)
The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Functional Suitability.


| **Criterion**                | **Description**                                                                                     | **Score (0-4)** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | -              |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | -              |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | -           |

In order to assign a score between 0 and 4 in each of the above criterion, the following scoring system was used. This system measures the number of different data plane formats / types / protocols supported from the ones that are included in the test.

Description | Scoring
-- | --
No data planes supported out of the box, and no possibility to develop others | 0
No data planes supported out of the box, but they can be developed ad-hoc. Coverage unknown | 1
1 or 2 data planes covered out of the box | 2
3 or 4 data planes covered out of the box | 3
5 or more data planes covered out of the box | 4
Ad-hoc customization of existing data plane(s) is possible (through configuration, not code) without having to build a new one | +1
    
