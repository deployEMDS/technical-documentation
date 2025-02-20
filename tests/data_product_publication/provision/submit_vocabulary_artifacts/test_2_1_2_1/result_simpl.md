## [2.1.2.1] Data product publication: Provision - Submit vocabulary artifacts
### Stack: SIMPL

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1,
the focus is on the Functional Suitability metric. For detailed information, please refer to the [Evaluation Criteria](./test.md#evaluation-criteria-) section in the test description.

#### Expected output
The test aims to assess that if the vocabulary hub's assets are available to every data space participant. Rank higher if the reference to a vocabulary asset is integrated in the data sharing process.

### Results
#### Assessment
#### Data sharing process - vocabulary hub - interoperability

In the definition of a vocabulary hub in [IDSA RAM 4.0](https://docs.internationaldataspaces.org/knowledge-base/ids-ram-4.0), it is a component that possesses a list of controlled terms to enhance the interoperability of data assets.
In the SIMPL implementation, we have not seen a separate component working on the semantic interoperability of sharing or shared data itself, as seen in the TNO products: [https://www.semantic-treehouse.nl/docs/use-sth/login](https://www.semantic-treehouse.nl/docs/use-sth/login),
nor has it been integrated into the SIMPL solution.

The main expected function of a vocabulary hub, which enforces the semantic interoperability of certain data models to the data source or provides annotations for qualified datasets, is not seen in the data transfer procedure of SIMPL at this time.

#### offering data products - vocabulary hub - interoperability

SIMPL forked the GAIA-X federated catalog services: [simpl-fc-service](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-fc-service) to orchestrate data offerings. 
This service includes the validation of the self-description of the data offering against certain schemas (represented by a SHACL shape). 
This component only validates against the SHACL shapes, not ontologies or vocabularies. 
SIMPL provides an example SHACL shape: [merged-shapes.ttl](https://code.europa.eu/simpl/simpl-open/development/data1/sdtooling-sd-schemas/-/raw/main/merged-shapes.ttl), which details how:

- ApplicationOffering
- DataOffering
- InfrastructureOffering
- ApplicationProperties
- DataProperties
- InfrastructureProperties
- ContractTemplate
- EdcConnector
- EdcRegistration
- GeneralServiceProperties
- OfferingPrice
- ProviderInformation
- ServicePolicy

should be, specifying the required cardinality, and data types.

The shapes and ontologies can be populated to the [simpl-fc-service](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-fc-service) as described in [sdtooling-sd-schemas_README](https://code.europa.eu/simpl/simpl-open/documentation/installation-guide/-/blob/main/documents/848_sdtooling-sd-schemas_README.pdf?ref_type=heads).
The schema publication and validation flow within [simpl-fc-service](https://code.europa.eu/simpl/simpl-open/development/gaia-x-edc/simpl-fc-service) is described in [Adding a Self-Description for an Offering](https://gaia-x.gitlab.io/data-infrastructure-federation-services/cat/architecture-document/architecture/catalogue-architecture.html#_adding_a_self_description_for_an_offering).

#### Measured results
As mentioned earlier, the current phase of SIMPL does not provide any vocabulary validation on the shared or sharing data itself. Therefore, based on the [Evaluation Criteria](./test.md#evaluation-criteria-), the following scores are assigned to the test:

- Can the data provider submit a new vocabulary? - No, the vocabulary hub is not available in the current version of SIMPL.
- Can the data provider choose from different standardized vocabulary that meet the requirements of the data source? - No
- Can the data provider submit custom metadata fields and link their semantic definition? - No
- Can the data provider access standardize vocabularies to then use them in the data source before provisioning the data? - No
- Does the EMDS interoperability facility validate the vocabulary used at the data source? - No
- Does the system provide feedback or error messages if a vocabulary submission fails validation? - No

**Functional Suitability Quality Metric Score: 0**

#### Notes
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   