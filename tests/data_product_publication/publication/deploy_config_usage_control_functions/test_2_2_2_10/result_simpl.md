## [2.2.2.10] Data product publication: Publication - Deploy/config usage control functions
### Stack: Simpl

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on
an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to assess that the policy language is extensible and score the results by flexibility and availability of development and testing facilities for new operators.

### Results
#### Assessment
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) uses the [Simpl EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) to manage the [Dataspace Protocol](https://docs.internationaldataspaces.org/ids-knowledgebase/dataspace-protocol). The [Simpl EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) includes the policy engine of the EDC connector.

As described in the README of [Simpl EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) , Simpl also uses the Open Digital Rights Language (ODRL) standard for its policy language, and its predefined policies, such as [consumption access constraints](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc/-/blob/main/src/main/java/eu/europa/ec/simpl/ConsumptionConstraintFunction.java?ref_type=heads) and [location access constraints](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc/-/blob/main/src/main/java/eu/europa/ec/simpl/LocationConstraintFunction.java?ref_type=heads), are implemented for processing ODRL.
These ODRL languages are not visible to the Simpl user, as Simpl uses the user interface: [Simpl Self Description UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui) for adding policies.

However, the [Simpl Self Description UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui) does not provide any customization or modification of the policies. 

The main development of Simpl so far has been these user interfaces.
Also, since Simpl is deployed within a Kubernetes cluster, customizing policies to include new operators and following deployment is not straightforward for its target users.

#### Measured results

The following score are assigned to the test with the above assessment:
The following scores are assigned to the test based on the above assessment:

| **Criterion**      | **Description**                                                                                          | **Score (0-4)** |                                                                                                                        |
|--------------------|----------------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------|
| **Adaptability**   | Adaptability for different or evolving hardware, software, or usage environments.                        | -   4           | ODRL and EDC policy engine are adaptable for future changes, the Simpl UI is also flexible to be extended.             |
| **Installability** | The components of the platform are successfully installed and/or uninstalled in a specified environment. | -   4           | The component can be packaged and deployed in any circumstances.                                                       |
| **Replaceability** | Replacement of the components for the same purpose in the same environment.                              | -   0           | For now we have not seen Simpl UI works with other data space connectors.                                              |              
| **Scalability**    | The product can handle growing to adapt its capacity.                                                    | -   4           | Simpl's development is targeting high volumes, particularly with its two-tier IAA system incorporating RBAC and ABAC.  |

Overall score calculation: (4 + 4 + 0 + 4) / 4 = 3
**Functional Suitability Quality Metric Score: 3**

#### Notes
The current testing version of Simpl is a very basic Minimum Viable Product solution, version 1.0.   