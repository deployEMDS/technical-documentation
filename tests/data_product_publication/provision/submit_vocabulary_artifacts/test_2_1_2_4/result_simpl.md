## [2.1.2.4] Data product publication: Provision - Submit vocabulary artifacts
### Stack: Simpl

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The test aims to assess that the vocabulary hub covers semantic or domain standards for the metadata. The more coverage of relevant standards, the higher the ranking.

### Results
#### Assessment
As stated in [test_2.1.2.1_result_simpl.md](../test_2_1_2_1/result_simpl.md), Simpl currently lacks integration of a vocabulary hub for validating the data sharing process.

Schema validation is only performed for the data product offering part using predefined SHACL shapes. Simpl provides a sample shape: [merged-shapes.ttl](https://code.europa.eu/simpl/simpl-open/development/data1/sdtooling-sd-schemas/-/raw/main/merged-shapes.ttl) for the data offering self-description. This shape is customized for Simpl as self-explained.

For metadata standards, we mostly refer to DCAT, which is a W3C recommendation. 
The DCAT vocabulary is an RDF vocabulary designed to facilitate interoperability between data catalogs published on the Web. 
The shapes presented in the Simpl example [yaml2shape](https://code.europa.eu/simpl/simpl-open/development/data1/sdtooling-sd-schemas/-/tree/main/yaml2shape?ref_type=heads)  and its merged version:  [merged-shapes.ttl](https://code.europa.eu/simpl/simpl-open/development/data1/sdtooling-sd-schemas/-/raw/main/merged-shapes.ttl) do not validate against DCAT.

#### Measured results
As mentioned earlier, the current phase of Simpl does not provide any vocabulary validation on the shared or sharing data itself. Therefore, based on the [Evaluation Criteria](./test.md#evaluation-criteria-), the following scores are assigned to the test:

- Does the vocabulary hub cover relevant semantic standards for the metadata? - No
- Does the vocabulary hub cover relevant domain standards for the metadata? - No
- Is there a comprehensive list of supported standards available? - No
- Can the data provider easily find and use the relevant standards in the vocabulary hub? - No
- Are there mechanisms in place to update and expand the coverage of standards in the vocabulary hub? - No
- Does the system provide feedback or error messages if a standard is not supported? - No
- Can the data provider view the status and details of the standards covered by the vocabulary hub? - No

**Functional Suitability Quality Metric Score: 0**
#### Notes
The current testing version of Simpl is a very basic Minimum Viable Product solution, version 1.0. 