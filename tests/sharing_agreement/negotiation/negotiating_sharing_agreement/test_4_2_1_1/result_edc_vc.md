## [4.2.1.1] Sharing agreement: Negotiation - Negotiating sharing agreement
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test utilizes the EDC MVD commit [5d58b38] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/5d58b3871983ce00a69a38b3215c6a8cb67d8ced).
- The test is executed in an Ubuntu environment using IntelliJ.
#### Tested quality metric and method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx)
For current phase (phase 1), the test focus on the Functional suitability quality metric

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
The test aims to assess the state machine implementation of the EDC ecosystem with regard to the sharing negotiation.

### Results
#### Assessment
The states of contract negotiation is possible with following status, the states in <span style="color:blue">**_blue_**</span> are covered by [Data Space Protocol State Machine](https://docs.internationaldataspaces.org/ids-knowledgebase/v/dataspace-protocol/contract-negotiation/contract.negotiation.protocol#id-1.1-states).

- <span style="color:blue">**_REQUESTED: A contract for a Dataset has been requested by the Consumer based on an Offer and the Provider has sent an ACK response._**</span>
- PENDING: A contract negotiation is on hold on one of the parties, might wait for external approves.
- <span style="color:blue">**_OFFERED: The Provider has sent an Offer to the Consumer and the Consumer has sent an ACK response._** </span>
- <span style="color:blue">**_ACCEPTED: The Consumer has accepted the latest Offer and the Provider has sent an ACK response._** </span>
- <span style="color:blue">**_AGREED: The Provider has accepted the latest Offer, sent an Agreement to the Consumer, and the Consumer has sent an ACK response._** </span>
- <span style="color:blue">**_VERIFIED: The Consumer has sent an Agreement verification to the Provider and the Provider has sent an ACK response._** </span>
- <span style="color:blue">**_FINALIZED: The Provider has sent a finalization message including his own Agreement verification to the Consumer and the Consumer has sent an ACK response. Data is now available to the Consumer._** </span>
- <span style="color:blue">**_TERMINATED: The Provider or Consumer has placed the CN in a terminated state. A termination message has been sent by either of the Participants and the other has sent an ACK response. This is a terminal state._** </span>
- COUNTER_PROPOSAL: The contract negotiation is hold on the provider side waiting for a COUNTER_PROPOSAL from consumer party.
- EXPIRED: The negotiation has expired due to a timeout or elapsed deadline without reaching an agreement.
- REVOKED: One of the parties has revoked their offer or request before it could be accepted or rejected.
- CANCELLED: The negotiation has been cancelled by mutual agreement of both parties.

##### EDC implementations 
As there is no TCK (Technology Compatibility Kit) has been published, there is no implementation can "conform" to DSP. However, there is a work in progress and EDC does intend to pass the TCK when it is available. [Refer here](https://github.com/eclipse-edc/Connector/discussions/4351#discussioncomment-10009825).

Within EDC implementation following states are implemented in the [ContractNegotiationStates](https://github.com/eclipse-edc/Connector/blob/f9f4d181cd92514ef1b2d9af96d14ab7ad77757f/spi/control-plane/contract-spi/src/main/java/org/eclipse/edc/connector/controlplane/contract/spi/types/negotiation/ContractNegotiationStates.java#L25)
- INITIAL(50),
- REQUESTING(100)
- REQUESTED(200)
- OFFERING(300)
- OFFERED(400)
- ACCEPTING(700)
- ACCEPTED(800)
- AGREEING(825)
- AGREED(850)
- VERIFYING(1050)
- VERIFIED(1100)
- FINALIZING(1150)
- FINALIZED(1200)
- TERMINATING(1300)
- TERMINATED(1400)



#### Measured results
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
[TODO] Add notes, if necessary.
