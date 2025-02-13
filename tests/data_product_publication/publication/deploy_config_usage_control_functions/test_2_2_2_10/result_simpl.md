## [2.2.2.10] Data product publication: Publication - Deploy/config usage control functions
### Stack: SIMPL


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
[Simpl-Open](https://code.europa.eu/simpl/simpl-open) uses the [SIMPL EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) to manage the [Dataspace Protocol](https://docs.internationaldataspaces.org/ids-knowledgebase/dataspace-protocol). The [SIMPL EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) includes the policy engine of the EDC connector.

As described in the README of [SIMPL EDC Connection](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc) , SIMPL also uses the Open Digital Rights Language (ODRL) standard for its policy language, and its predefined policies, such as [consumption access constraints](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc/-/blob/main/src/main/java/eu/europa/ec/simpl/ConsumptionConstraintFunction.java?ref_type=heads) and [location access constraints](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-edc/-/blob/main/src/main/java/eu/europa/ec/simpl/LocationConstraintFunction.java?ref_type=heads), are implemented for processing ODRL.
These ODRL languages are not visible to the SIMPL user, as SIMPL uses the user interface: [SIMPL Self Description UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui) for adding policies.

However, the [SIMPL Self Description UI](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-sd-ui) does not provide any customization or modification of the policies. 

The main development of SIMPL so far has been these user interfaces.
Also, since SIMPL is deployed within a Kubernetes cluster, customizing policies to include new operators and following deployment is not straightforward for its target users.

#### Measured results

The following score are assigned to the test with the above assessment:
The following scores are assigned to the test based on the above assessment:

| **Criterion**      | **Description**                                                                                          | **Score (0-4)** |                                                                                                            |
|--------------------|----------------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------|
| **Adaptability**   | Adaptability for different or evolving hardware, software, or usage environments.                        | -   4           | ODRL and EDC policy engine are adaptable for future changes, the SIMPL UI is also flexible to be extended. |
| **Installability** | The components of the platform are successfully installed and/or uninstalled in a specified environment. | -   4           | The component can be packaged and deployed in any circumstances.                                           |
| **Replaceability** | Replacement of the components for the same purpose in the same environment.                              | -   0           | For now we have not seen SIMPL UI works with other data space connectors.                                  |              
| **Scalability**    | The product can handle growing to adapt its capacity.                                                    | -   2           | EDC and SIMPL are both open source and have extensibilities.                                               |

Overall score calculation: (4 + 4 + 0 + 2) / 4 = 2.5
**Functional Suitability Quality Metric Score: 2.5**

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   