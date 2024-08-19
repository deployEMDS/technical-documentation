## [4.2.1.7] Sharing agreement: Negotiation - Negotiating sharing agreement
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test leverages the EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93).
- It uses EDC version [0.8.2-SNAPSHOT](https://github.com/eclipse-edc/MinimumViableDataspace/blob/8da0c4e6a8921dcb6ff189c2901868979bdc9a93/gradle/libs.versions.toml#L7).
- The test is performed on an Ubuntu environment with IntelliJ.

#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx).\
For the current phase (Phase 1), the test focuses on the Functional Suitability metric.

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
The test aims to verify that the system generates logs detailing the sharing agreement process. A higher rank will be given if these logs include business information in a standardized format.

### Results
#### Assessment
When executing a sharing agreement negotiation within EDC MVD commit [8da0c4e](https://github.com/eclipse-edc/MinimumViableDataspace/commit/8da0c4e6a8921dcb6ff189c2901868979bdc9a93), the connector logs status updates as follows:
In the `provider` log for `ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9`, the process is detailed through various stages:

```text
DEBUG 2024-08-19T13:38:27.005955896 DSP: Incoming ContractRequestMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process
DEBUG 2024-08-19T13:38:27.153020832 [PROVIDER] ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9 is now in state REQUESTED.
DEBUG 2024-08-19T13:38:28.088552426 [ProviderContractNegotiationManagerImpl] ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9 is now in state AGREEING
DEBUG 2024-08-19T13:38:28.088734016 ContractNegotiation: ID 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9. [Provider] send agreement
DEBUG 2024-08-19T13:38:28.99746865 ContractNegotiation: ID 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9. [Provider] send agreement
DEBUG 2024-08-19T13:38:28.997585967 [ProviderContractNegotiationManagerImpl] ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9 is now in state AGREED
DEBUG 2024-08-19T13:38:30.024040375 DSP: Incoming ContractAgreementVerificationMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9
DEBUG 2024-08-19T13:38:30.13703795 [PROVIDER] ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9 is now in state VERIFIED.
DEBUG 2024-08-19T13:38:30.141847687 [ProviderContractNegotiationManagerImpl] ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9 is now in state FINALIZING
DEBUG 2024-08-19T13:38:30.141963485 ContractNegotiation: ID 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9. [Provider] send finalization
DEBUG 2024-08-19T13:38:30.350142882 ContractNegotiation: ID 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9. [Provider] send finalization
DEBUG 2024-08-19T13:38:30.35023427 [ProviderContractNegotiationManagerImpl] ContractNegotiation 1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9 is now in state FINALIZED
```

In the `consumer` log, the identifier `5204e110-a899-44fa-8199-87f2b7d7b32c` corresponds to the consumer side of the negotiation for `1bb59a3e-692a-40d5-b6d4-a8a223f5d0e9` and tracks its progress:

```text
DEBUG 2024-08-19T13:38:26.050906687 [ConsumerContractNegotiationManagerImpl] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state INITIAL
DEBUG 2024-08-19T13:38:26.785097428 [ConsumerContractNegotiationManagerImpl] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state REQUESTING
DEBUG 2024-08-19T13:38:26.855357612 ContractNegotiation: ID 5204e110-a899-44fa-8199-87f2b7d7b32c. [Consumer] send request
DEBUG 2024-08-19T13:38:27.258747111 ContractNegotiation: ID 5204e110-a899-44fa-8199-87f2b7d7b32c. [Consumer] send request
DEBUG 2024-08-19T13:38:27.258883088 [ConsumerContractNegotiationManagerImpl] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state REQUESTED
DEBUG 2024-08-19T13:38:28.190560002 DSP: Incoming ContractAgreementMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: 5204e110-a899-44fa-8199-87f2b7d7b32c
DEBUG 2024-08-19T13:38:28.824549175 [DEMO] Node filter: skipping node 'did:web:localhost%3A7083' for participant 'did:web:localhost%3A7083'
DEBUG 2024-08-19T13:38:28.985700927 [CONSUMER] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state AGREED.
DEBUG 2024-08-19T13:38:29.972298702 [ConsumerContractNegotiationManagerImpl] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state VERIFYING
DEBUG 2024-08-19T13:38:29.972997128 ContractNegotiation: ID 5204e110-a899-44fa-8199-87f2b7d7b32c. [consumer] send verification
DEBUG 2024-08-19T13:38:30.137937195 ContractNegotiation: ID 5204e110-a899-44fa-8199-87f2b7d7b32c. [consumer] send verification
DEBUG 2024-08-19T13:38:30.138071291 [ConsumerContractNegotiationManagerImpl] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state VERIFIED
DEBUG 2024-08-19T13:38:30.190656705 DSP: Incoming ContractNegotiationEventMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: 5204e110-a899-44fa-8199-87f2b7d7b32c
DEBUG 2024-08-19T13:38:30.349225751 [CONSUMER] ContractNegotiation 5204e110-a899-44fa-8199-87f2b7d7b32c is now in state FINALIZED.
```

The logs capture the detailed sequence of the sharing agreement (contract negotiation) process, using a "log4j-style" logging format. This format, while not officially standardized, is a commonly used pattern in software development. The Java library is available at: [https://logging.apache.org/log4j/2.x/](https://logging.apache.org/log4j/2.x/).

#### Measured results
As described above, EDC offers an open-box solution for logging that thoroughly documents the sharing agreement process using a widely used format. Consequently, the following score is assigned to the test:

**Functional Suitability Quality Metric: 4**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.