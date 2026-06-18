# Result: EMDS Final Stack

## Information

| Field | Value |
|---|---|
| Result perspective | EMDS Final Stack |
| Existing test ID | 5.1.1.1 |
| Existing test name | Request data transfer |
| KPI | KPI1 - Maturity, reliability and security of the common technical infrastructure building blocks deployed |
| Assessment purpose | Integration readiness baseline |
| Assessment level | UC validation + technical validation |
| Installation model | CaaS / On-premise / Mixed |
| Status | Draft baseline template |

## Context

This result file does not replace the historical EDC+VC or Fiware test results. It adds a new result perspective for the current EMDS integrated technical infrastructure.

The purpose is to reuse the existing deployEMDS technology testing catalogue for KPI1, while adapting the assessment to the current project phase. The focus is not stack comparison, but the integration readiness of the selected common infrastructure.

## Quality model mapping

For KPI1, this test is mapped to the following ISO/IEC 25010 characteristics:

| ISO/IEC 25010 characteristic | Interpretation for this test |
|---|---|
| Functional suitability | The stack provides a mechanism to request and manage data transfer |
| Compatibility / interoperability | The transfer process can operate across relevant EMDS components and participants |
| Reliability | Transfer status, results and past actions can be retrieved or traced |
| Security | The transfer request and related APIs are protected by the expected access control mechanisms |
| Maintainability | Evidence is available to troubleshoot and repeat the test |

## Expected capability

The EMDS final stack should provide a documented and secured mechanism to:

- initiate a data sharing request;
- retrieve data sharing information and status;
- receive or inspect the outcome of the request;
- retrieve information about past data sharing actions;
- provide enough operational evidence through API responses, logs, screenshots, GitHub/Jira issues, deployment status or test execution records.

## Assessment dimensions

| Dimension | Question |
|---|---|
| UC validation | Can the use case or tech buddy execute or observe the data transfer flow in practice? |
| Technical validation | Is the underlying common infrastructure deployed, integrated, secured and technically verifiable? |
| Installation model | Is the evidence coming from CaaS, on-premise or a mixed setup? |
| Evidence | Is there a concrete artefact supporting the score? |

## Scoring scale

| Score | Meaning for KPI1 |
|---:|---|
| 0 | Not available / not attempted / no evidence |
| 1 | Available conceptually or blocked |
| 2 | Deployed or in progress, but only partially tested |
| 3 | Working with evidence in a local or controlled context |
| 4 | Integrated with the common/federated infrastructure, secured, stable and repeatable |

Scores of 3 or 4 require supporting evidence.

## Results

| Requirement | UC validation | Technical validation | Installation model | Evidence | Score |
|---|---|---|---|---|---:|
| Initiate a data sharing request | To be completed | To be completed | CaaS / On-premise / Mixed | TBD | TBD |
| Retrieve data sharing information and status | To be completed | To be completed | CaaS / On-premise / Mixed | TBD | TBD |
| Receive or inspect the data sharing request outcome | To be completed | To be completed | CaaS / On-premise / Mixed | TBD | TBD |
| Retrieve information about past data sharing actions | To be completed | To be completed | CaaS / On-premise / Mixed | TBD | TBD |
| Access logs, status or operational evidence for troubleshooting | To be completed | To be completed | CaaS / On-premise / Mixed | TBD | TBD |

## Installation model considerations

### CaaS

For CaaS deployments, the infrastructure availability, endpoint exposure, service health, logs and operational evidence should mainly be validated by IONOS and the relevant component owners. The UC or tech buddy validates whether the capability can be used from the use case perspective.

### On-premise

For on-premise deployments, the UC technical team validates local installation, network access, firewall/DNS/certificate constraints and connectivity with the common or federated infrastructure. Component owners support the validation of integration points.

### Mixed

For mixed setups, evidence should explicitly state which part of the flow is running in CaaS and which part is running locally.

## KPI1 assessment

| Item | Value |
|---|---|
| Overall score | TBD |
| Main maturity gap | TBD |
| Main reliability gap | TBD |
| Main security gap | TBD |
| Main blocker | TBD |
| Owner / next action | TBD |

## Notes

This file is intended as a draft template to demonstrate how KPI1 can be integrated into the existing deployEMDS testing structure without changing the historical EDC+VC and Fiware results.
