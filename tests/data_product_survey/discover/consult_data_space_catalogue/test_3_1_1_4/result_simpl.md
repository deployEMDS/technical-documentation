## [3.1.1.4] Data product survey: Discover - Consult data space catalogue
### Stack: SIMPL

### Statement of assessment
#### Environment

The testing environment is an IMEC self-deployed instances of [Simpl-Open](https://code.europa.eu/simpl/simpl-open) on an IONOS Kubernetes cluster, the version used is 1.0.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

The test aims to determine whether the data product specification provides the necessary metadata for quality reporting or if the catalog needs to be extended with an "-AP" profile, with the former being ranked higher. The system may offer varying levels of support for Napcore's DCAT-AP profile, such as [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) profiles. The evaluation focuses on the level of support for the Napcore Profile and its vocabulary.

### Results

#### Assessment

As mentioned in the [result_edc_vc](result_edc_vc.md), [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) uses ontologies from [Vocab-DQV (namespace: dqv)](https://www.w3.org/TR/vocab-dqv/) and [Web Annotation Vocabulary (namespace: oa)](https://www.w3.org/TR/annotation-vocab/) to describe quality annotations for datasets. 
In the SIMPL-OPEN implementation, templates are used for creating self-descriptions when creating a data offering. 
There are a few predefined SHACL shapes available for different types of offerings, as stated [here](https://code.europa.eu/simpl/simpl-open/development/data1/sdtooling-api-be/-/tree/main/shapes/simpl/Service). 
It is also possible to add more shapes to meet the quality requirements of [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html). 
e.g. a `DataOfferingShape-MobilityDCAT-AP` shape rquires quality ontologies from MobilityDCAT-AP, such as
- `dqv:hasQualityAnnotation`
- `oa:hasBody`
- `oa:hasTarget`

```turtle
@prefix gax-validation: <http://w3id.org/gaia-x/validation#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix simpl: <http://w3id.org/gaia-x/simpl#> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix dqv: <http://www.w3.org/ns/dqv#> .
@prefix oa: <https://www.w3.org/TR/annotation-vocab/#> .

gax-validation:DataOfferingShape-MobilityDCAT-AP a sh:NodeShape ;
    sh:targetClass simpl:DataOffering ;
    sh:property [
        sh:path dqv:hasQualityAnnotation ;
        sh:nodeKind sh:IRI ;
        sh:minCount 1 ;
    ] ;
    sh:property [
        sh:path oa:hasBody ;
        sh:nodeKind sh:IRI ;
        sh:minCount 1 ;
    ] ;
    sh:property [
        sh:path oa:hasTarget ;
        sh:nodeKind sh:IRI ;
        sh:minCount 1 ;
    ] .
```

These predefined and customized shapes will be shared via NFS through multiple pods (Kubernetes) and used by catalog-ui via xsfc-advsearch to offer advanced query options, as stated in the catalog section (advanced search) [test_3.1.1.1_result_simpl.md](../test_3_1_1_1/result_simpl.md#advanced-search).

#### Measured results

As demonstrated, the catalog returned by the EDC connector's querying endpoint conforms to the [MobilityDCAT-AP](https://mobilitydcat-ap.github.io/mobilityDCAT-AP/releases/index.html) standard from a quality annotation perspective. Therefore, based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section of the test description, the test is assigned the following score:

**Functional Suitability Quality Metric: 4**

#### Notes                                                                                             
The current testing version of SIMPL is a very basic Minimum Viable Product solution, version 1.0.   