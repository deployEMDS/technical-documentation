## [2.1.2.3] Data product publication: Provision - Submit vocabulary artifacts
### Stack: SIMPL

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to assess if and how a change in a vocabulary hub asset is executed. Rank higher if integrity controls are in place.

### Results
#### Assessment
As mentioned in [test_2.1.2.1_result_simpl.md](../test_2_1_2_1/result_simpl.md), 
SIMPL currently does not integrate a vocabulary hub for validating data sharing process.

Schema validation only occurs for the data product offering part with seeded SHACL shapes. 
These shapes can be published via the API of the [simpl-fc-service](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-fc-service). 

The new publication of the data offering self-description is validated against composite schemas [getCompositeSchema](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-fc-service/-/blame/main/fc-service-core/src/main/java/eu/xfsc/fc/core/service/schemastore/SchemaStore.java?ref_type=heads#L92)\
which composites the RDF graph.

#### Measured results
As mentioned earlier, the current phase of SIMPL does not provide any vocabulary validation on the shared or sharing data itself. Therefore, based on the [Evaluation Criteria](./test.md#evaluation-criteria-), the following scores are assigned to the test:

- Can the data provider request to update/modify a vocabulary asset? - No, the vocabulary hub is not available in the current version of SIMPL for data sharing.
- Is the change in the vocabulary hub asset executed successfully? - No
- Are integrity controls in place to ensure the accuracy and consistency of the vocabulary asset changes? - No
- Does the system provide feedback or error messages if the update/modification fails? - No
- Can the data provider view the status of the requested changes to the vocabulary asset? - No
- Are there logs or audit trails available for the changes made to the vocabulary hub asset? - No

**Functional Suitability Quality Metric Score: 0**

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0. 