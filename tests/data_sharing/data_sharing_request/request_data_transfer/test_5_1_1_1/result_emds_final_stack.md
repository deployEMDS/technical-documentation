## [5.1.1.1] Data sharing: Data sharing request - Request data transfer

### Stack: EMDS Final Stack (EDC-based)

### Statement of assessment

#### Environment

- The assessment targets the current EMDS integrated technical infrastructure.
- The stack is based on the EDC connector and the common/federated EMDS building blocks selected for the current project phase.
- The assessment should distinguish between the following installation models:
  - CaaS: IONOS-managed deployment.
  - On-premise: deployment managed by the local UC technical team.
  - Mixed: combination of CaaS and local/on-premise components.
- The exact EDC version, deployment environment, release and component configuration must be confirmed during the KPI1 baseline execution.
- This result perspective does not replace the historical EDC+VC or Fiware results. It introduces an EMDS Final Stack perspective focused on integration readiness.

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).

For the KPI1 baseline, the original evidence-based technology testing approach is reused and simplified. The objective is no longer to compare stacks, but to assess the maturity, reliability and security of the common EMDS technical infrastructure building blocks deployed.

The assessment is mapped to selected ISO/IEC 25010 quality characteristics:

- Functional suitability: the transfer request capability provides the expected functionality.
- Compatibility / interoperability: the transfer flow integrates with the relevant EMDS components and data planes.
- Reliability: the transfer request can be executed and monitored in a repeatable way.
- Security: the API and related flows are authenticated, authorised and protected.
- Maintainability: the flow can be configured, monitored, troubleshot and documented.

The result should be informed by two complementary validation levels:

| Level | Completed by | Purpose |
|---|---|---|
| UC validation | Use case technical experts / tech buddies | Validate whether the use case can execute or use the transfer flow in practice |
| Technical validation | Component owners / infrastructure teams | Validate whether the common building blocks are deployed, integrated, reliable and secured |

#### Expected Output

The test aims to provide a comprehensive evaluation of the following aspects:

- **Assess the availability of the data transfer API:** Ensure that the relevant API or transfer mechanism is accessible and functional in the EMDS final stack.
- **Test data sharing requests:** Verify that data sharing requests are correctly processed, covering these steps:
  - Initiating a data sharing request.
  - Retrieving information and status of the data sharing request.
  - Receiving the outcome of the data sharing request, including conditions.
  - Accessing information on past data sharing activities.
- **Distinguish local and federated execution:** Identify whether the transfer flow works only locally, through the common/federated infrastructure, or across sites.
- **Capture evidence:** Collect endpoint responses, screenshots, logs, GitHub/Jira references, deployment status or confirmation from the relevant component owner.
- **Identify blockers:** Record technical, organisational, infrastructure, security or documentation blockers.

The system will score higher if the transfer request is integrated with the common/federated EMDS infrastructure, secured, stable, repeatable and supported by evidence.

### Results

#### Assessment

The EMDS Final Stack assessment reuses this existing test definition to validate whether the current EDC-based EMDS infrastructure can support data transfer requests from an integration-readiness perspective.

The assessment should verify whether the selected deployment model, CaaS, on-premise or mixed, can support the following capabilities:

- initiate a data sharing request;
- retrieve data sharing information and status;
- receive the outcome of the request;
- retrieve information about previous data sharing actions;
- provide sufficient logs or operational evidence to troubleshoot the flow;
- confirm whether the flow is local, federated or cross-site.

For CaaS deployments, infrastructure availability, endpoint exposure, access credentials and logs are mainly validated by IONOS and the relevant component owners.

For on-premise deployments, the UC technical team validates the local installation, network configuration, firewall/DNS/certificate constraints and connectivity with the common/federated infrastructure.

#### Measured results

| Requirement | UC validation | Technical validation | Evidence | Measured KPI |
|---|---|---|---|---:|
| Initiate a data sharing request | To be completed | To be completed | TBD | TBD |
| Retrieve data sharing information and status | To be completed | To be completed | TBD | TBD |
| Receive data sharing request outcome condition | To be completed | To be completed | TBD | TBD |
| Retrieve data sharing information of past data sharing actions | To be completed | To be completed | TBD | TBD |

**Overall Calculation:** TBD  
**Functional Suitability Quality Metric Score:** TBD

#### KPI1 scoring interpretation

For the KPI1 baseline, the following simplified 0-4 scale is proposed:

| Score | Meaning |
|---:|---|
| 0 | Not available / not attempted / no evidence |
| 1 | Available conceptually or blocked |
| 2 | Deployed or in progress, but partially tested |
| 3 | Working with evidence in local or controlled context |
| 4 | Integrated with the common/federated infrastructure, secured, stable and repeatable |

A score of 3 or higher should be supported by evidence.

#### Notes

This result perspective is intended as a baseline template for the EMDS Final Stack.

It should be completed during the KPI1 assessment using evidence from:

- WP2 questionnaire updates;
- UC validation tests;
- technical validation by component owners;
- IONOS CaaS deployment status, where applicable;
- on-premise deployment evidence, where applicable;
- GitHub/Jira issues;
- logs, screenshots, endpoint responses or test execution records.

The result should not be interpreted as a new stack comparison. It is an integration-readiness assessment of the selected EMDS technical infrastructure.