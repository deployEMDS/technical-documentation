## [2.2.2.4] Data product publication: Publication - Deploy/config usage control functions
### Stack: SIMPL

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on
an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to assess if the system provides an API or libraries to embed custom usage enforcement functions that can be invoked by usage policies.

### Results
#### Assessment

As mentioned in the [test_2_2_2_1](../test_2_2_2_1/result_simpl.md), 
SIMPL provides predefined access and usage policies through its [SIMPL Self Description UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui). 
Additionally, SIMPL has developed EDC policy engines with predefined policies :  [consumption access constraints](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc/-/blob/main/src/main/java/eu/europa/ec/simpl/ConsumptionConstraintFunction.java?ref_type=heads) and [location access constraints](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc/-/blob/main/src/main/java/eu/europa/ec/simpl/LocationConstraintFunction.java?ref_type=heads).
We observed that the access policy is enforced by the defined functions, but usage policies, such as deletion after usage, are not enforced.

For policy development and customization, 
SIMPL offers the same extensibility as EDC from a developer's perspective.
However, SIMPL focuses on providing production-grade components with user interfaces, which makes customization difficult for its target users unless a user interface is available. Currently, this feature is not part of the SIMPL solution. 
The SIMPL solution only includes a UI for selecting predefined policies, not for customization.

#### Measured results
SIMPL's contributions to the Dataspace ecosystem lie in its UI features. Therefore, this test will be evaluated based on its UI features. The following scores are assigned to the test:


| **Criterion**                | **Description**                                                                                     | **Score (0-4)** |
|------------------------------|-----------------------------------------------------------------------------------------------------|-----------------|
| **Functional Completeness**   | Technical requirements cover all the specified tasks and user objectives.                          | 1               |
| **Functional Correctness**    | Technical requirements meet results with the needed degree of precision.                           | 1               |
| **Functional Appropriateness**| Technical requirements facilitate the accomplishment of specified tasks and objectives.            | 1               |


**Functional Suitability Quality Metric Score: 1**


#### Notes

The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   