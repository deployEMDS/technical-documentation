## [4.2.3.2] Sharing agreement: Negotiation - Refusal or registration of sharing agreement
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [5d58b38](https://github.com/eclipse-edc/MinimumViableDataspace/commit/5d58b3871983ce00a69a38b3215c6a8cb67d8ced).
- The test is executed in an Ubuntu environment using IntelliJ.
#### Tested quality metric and method
The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output
The expected outcome of the current test is to evaluate whether the system provides an observability trace of the sharing agreement (privacy terms of observability are out of scope).

### Results

When a `Contract negotiation` is initiated by a `Consumer` via an API call, such as `/api/management/v3/contractnegotiations`, clear traces with appropriate states are recorded in the logs of the involved connectors, for example:

Logs for `ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb` on the `consumer` connector as follows:
```text
DEBUG 2024-07-24T12:35:55.205642506 [ConsumerContractNegotiationManagerImpl] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state INITIAL
DEBUG 2024-07-24T12:35:55.470100382 [ConsumerContractNegotiationManagerImpl] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state REQUESTING
DEBUG 2024-07-24T12:35:55.470552694 ContractNegotiation: ID a1a32534-6c1d-4875-bd48-3b2cc41da8eb. [Consumer] send request
DEBUG 2024-07-24T12:35:55.816844368 ContractNegotiation: ID a1a32534-6c1d-4875-bd48-3b2cc41da8eb. [Consumer] send request
DEBUG 2024-07-24T12:35:55.816948427 [ConsumerContractNegotiationManagerImpl] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state REQUESTED
DEBUG 2024-07-24T12:35:56.503153685 DSP: Incoming ContractAgreementMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: a1a32534-6c1d-4875-bd48-3b2cc41da8eb
DEBUG 2024-07-24T12:35:56.888602662 [CONSUMER] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state AGREED.
DEBUG 2024-07-24T12:35:57.549414156 [ConsumerContractNegotiationManagerImpl] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state VERIFYING
DEBUG 2024-07-24T12:35:57.549611466 ContractNegotiation: ID a1a32534-6c1d-4875-bd48-3b2cc41da8eb. [consumer] send verification
DEBUG 2024-07-24T12:35:57.838410104 ContractNegotiation: ID a1a32534-6c1d-4875-bd48-3b2cc41da8eb. [consumer] send verification
DEBUG 2024-07-24T12:35:57.838515447 [ConsumerContractNegotiationManagerImpl] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state VERIFIED
DEBUG 2024-07-24T12:35:58.533433993 DSP: Incoming ContractNegotiationEventMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: a1a32534-6c1d-4875-bd48-3b2cc41da8eb
DEBUG 2024-07-24T12:35:58.72499179 [CONSUMER] ContractNegotiation a1a32534-6c1d-4875-bd48-3b2cc41da8eb is now in state FINALIZED.
```
The corresponding `ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb` logs in the `provider` connector are as follows:
```text
DEBUG 2024-07-24T12:35:55.588913773 DSP: Incoming ContractRequestMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process
DEBUG 2024-07-24T12:35:55.75999992 [PROVIDER] ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb is now in state REQUESTED.
DEBUG 2024-07-24T12:35:56.30306143 [ProviderContractNegotiationManagerImpl] ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb is now in state AGREEING
DEBUG 2024-07-24T12:35:56.303415276 ContractNegotiation: ID c4dec03e-e21f-4103-b186-6a0e8447d1fb. [Provider] send agreement
DEBUG 2024-07-24T12:35:56.890075427 ContractNegotiation: ID c4dec03e-e21f-4103-b186-6a0e8447d1fb. [Provider] send agreement
DEBUG 2024-07-24T12:35:56.890262842 [ProviderContractNegotiationManagerImpl] ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb is now in state AGREED
DEBUG 2024-07-24T12:35:57.622123397 DSP: Incoming ContractAgreementVerificationMessage for class org.eclipse.edc.connector.controlplane.contract.spi.types.negotiation.ContractNegotiation process: c4dec03e-e21f-4103-b186-6a0e8447d1fb
DEBUG 2024-07-24T12:35:57.837314656 [PROVIDER] ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb is now in state VERIFIED.
DEBUG 2024-07-24T12:35:58.44331619 [ProviderContractNegotiationManagerImpl] ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb is now in state FINALIZING
DEBUG 2024-07-24T12:35:58.443776224 ContractNegotiation: ID c4dec03e-e21f-4103-b186-6a0e8447d1fb. [Provider] send finalization
DEBUG 2024-07-24T12:35:58.726042394 ContractNegotiation: ID c4dec03e-e21f-4103-b186-6a0e8447d1fb. [Provider] send finalization
DEBUG 2024-07-24T12:35:58.726205646 [ProviderContractNegotiationManagerImpl] ContractNegotiation c4dec03e-e21f-4103-b186-6a0e8447d1fb is now in state FINALIZED
```
#### Assessment
#### Measured results

Based on the test results, the system is rated a **4** according to the matrix outlined at [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-). Given the extensible nature of EDC, you can add an extension to the [logging service](https://github.com/eclipse-edc/docs/blob/3d6b6641f0c6e40c514ca52ec17ecb45ecf9d29b/developer/logging.md) to achieve a higher score.

**Functional suitability quality metric: 4**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to write their own extensions.
