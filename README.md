deployEMDS
========
The common [European mobility data space (EMDS)](deployemds.eu) aims to facilitate data access, pooling and sharing for more efficient, safe, sustainable and resilient transport.

The deployEMDS project’s primary objective is to deploy an operational data space and common governance mechanisms to facilitate trusted and secure data sharing in the context of urban mobility.

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

* The technical implementations of the `test facilities`_(see infra.)_
* The test environment, where reference data sources, data schemas, vocabularies, and usage control policies are shared across all tests.
* The tests and assessments, these are linked to the data space participants' customer journeys covering the essential data space capabilities.

A `test facility` is an environment where a pre-defined technology stack is tested. There might be more test facilities based on the same core technologies but using different capabilities, if this would affect the tests.
For instance: EDC using verifiable credentials, EDC using iShare, Fiware, …

Each test facility develops tests adapted to the data space’s technology. The test definitions are data space stack-agnostic, while the test implementat
