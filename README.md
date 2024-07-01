deployEMDS
========
### deployEMDS empowers interoperable, trustworthy and accessible data sharing

[deployEMDS](https://deployemds.eu/) is a project co-funded under the [EU Digital Europe Programme](https://digital-strategy.ec.europa.eu/en/activities/digital-programme) and responds to its outlined challenges. The project will help make the common European mobility data space a reality.  The initiative will cultivate a broad European ecosystem of data providers and users, facilitating the adoption of common building blocks. 16 use cases from nine EU countries will contribute to the development of innovative services and applications.

The European mobility data space (EMDS) will offer a framework for interlinking and federating ecosystems. deployEMDS supports the EMDS initiative through:
* **Data interoperability:** Sharing and exchaging data in a standardised way
* **Data sovereignty and trust:** Retaining authority and control over data
* **Accessibility:** Discoverability and availability of mobility data

The project supports real-life implementations in nine cities and regions: 
* Barcelona (ES)
* Île-de-France (FR)
* Milan (IT)
* Lisbon (PT)
* Flanders (BE)
* Sofia (BG)
* Stockholm (SE)
* Tampere (FI)
* Budapest (HU).

These initiatives focus on the development of innovative services and applications in urban mobility, while assisting in policymaking through the sharing and reuse of data.

The repository
==============
The **deployEMDS** repository is the reference container of a thorough assessment of multiple data space technology stacks, more in detail:

* The technical implementations of the `test facilities`_(see infra)_
* The test environment, where reference data sources, data schemas, vocabularies, and usage control policies are shared across all tests.
* The tests and assessments, these are linked to the data space participants' customer journeys covering the essential data space capabilities.

A `test facility` is an environment where a pre-defined technology stack is tested. There might be more test facilities based on the same core technologies but using different capabilities, if this would affect the tests.
For instance: EDC using verifiable credentials, EDC using iShare, Fiware, ...

Each test facility develops tests adapted to the data space's technology. The test definitions are data space stack-agnostic, while the test implementations are specific to the facility. Tests must produce the same expected outcome, but no assumption is made on approaches and technology.

The workflow
============
A **sandbox environment** is provided by IONOS to deploy data space stacks. SaaS providers must make sure that their services are accessible from this environment.

A **data space stack** is the combination of technical building blocks, and it might span over more than one framework (e.g., EDC + iShare). The choice of the stack is delegated to the EMDS Building Block Working Group. The deployment of the stack should result in a mock data space. 

The **testing facility** is the composition of infrastructure, data space stack, and test squad (team). We define one stack per test facility, and the mock data space should be consistent for each testing facility. They should have: 
- The same participants and their identities.
- The same data product(s) being shared.
- The same usage policies.
- The same data planes.
- The same root taxonomies and vocabularies describing the data product(s).
- The same certificate authority.

The testing facilities will use a phased or agile approach,  where in each phase specific components are deployed and tested. 
The progress of each testing facility will be tracked by use of reporting tools, _in casu_ the [Github issues](https://github.com/imec-int/deployEMDS/issues) of this repository.


