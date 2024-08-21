## [1.2.2.2] Participant onboarding: Evaluation - Proof of identity
### Stack: Fiware

### Statement of assessment
#### Environment

The test is conducted in the IONOS FIWARE_cluster cluster using node pool IP 85.215.161.198.

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative criteria (checklists, ...)
Asssess if the following can be done:
- The identity framework can establish relationships between identities.
- The identity records support formats and standards that univocally describe an organisation.
- Organisations can use the identity framework to issue certain claims.
- The information is accessible to the systems participating to the data space, preferably using a format that is recognised cross-border.

#### Expected output
To determine organization's capabilities within the connector. 

### Results
#### Assessment
The Data Space Connector supports the role of the LEGAL_REPRESENTATIVE which is able to register an organization through the Parties API.
The role is connected to policies inside the Authorization Registry. Those policies define the paths and operations available at the TMForum API. In this case: "GET", "POST" and "PUT" on the Parties-API.
Also, Keycloak as the IDM system, provides the capabilities to issue VerifiableCredential to users and also Gaia-X Self-Descriptions to its Legal-Representatives.

The **FIWARE Data Space Connector** in conjunction with **Keycloak** can meet the specified requirements:

1. **Establishing Relationships Between Identities:** . While it doesn't directly manage relationships between entities in the way a social network or enterprise relationship management system might, it provides several features and mechanisms that can facilitate and indirectly support managing relationships between entities.
2. **Support for Formats and Standards:** Keycloak uses standards such as JWT and OIDC, which are widely recognized and accepted.
3. **Issuing Claims:** Keycloak allows for the issuance of tokens with claims about identities and attributes, and the connector can integrate to use these claims.
4. **Accessibility of Information:** Identity information can be accessed through standardized APIs, facilitating interoperability in the data space.







#### Measured results


Here is a detailed description of the measured results: 


## Participant Onboarding: Evaluation - Proof of Identity

| **Criterion**                                           | **Description**                                                                                                 | **Score (0-4)** | **Explanation**                                                                                           |
|---------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------|
| **Establishment of Relationships Between Identities**  | The identity framework can establish relationships between identities.                                       | 0               | The Data Space Connector does not dirrectly support relationships between identities. |
| **Identity Records Formats and Standards**              | The identity records support formats and standards that univocally describe an organization.                  | 4               | Keycloak uses widely accepted standards such as JWT and OIDC, ensuring clear and unambiguous descriptions of organizations. |
| **Issuance of Claims**                                | Organizations can use the identity framework to issue certain claims.                                         | 3               | Keycloak allows for issuing tokens with claims about identities, but the framework may have limitations in the types of claims or their usage. |
| **Accessibility and Cross-Border Recognition**         | The information is accessible to systems participating in the data space, using a cross-border recognized format. | 2               | While the information is accessible through standardized APIs, the format used may not be fully recognized or standardized across different borders. |

**Overall score**: (0 + 4 + 3 + 2) / 4 = 2.25



#### Notes

