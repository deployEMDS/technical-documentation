## [4.2.1.1] Sharing agreement: Negotiation - Negotiating sharing agreement
### Stack: EDC+VC

### Statement of assessment
#### Environment
- The test uses the EDC MVD commit [84f3c5f7] (https://github.com/eclipse-edc/MinimumViableDataspace/commit/84f3c5f70b4eea94de7ebee83da377e62fc759fd)


#### Tested quality metric and method
[TODO] Describe the quality metric and method used for the test / assessment

#### Comparative criteria (checklists, ...)
[TODO] Describe the comparative criteria used for the test / assessment. If possible, align with the criteria used for the same test in the other stack(s).

#### Expected output
The test is supposed to evaluate the state machine implementation of the EDC ecosystem regarding the sharing negotiation.

### Results
#### Assessment
The states of contract negotiation is possible with following status.

- REQUESTED: A contract for a Dataset has been requested by the Consumer based on an Offer and the Provider has sent an ACK response.
- PENDING: A contract negotiation is on host on the provider/consumer party, might wait for external approves.
- OFFERED: The Provider has sent an Offer to the Consumer and the Consumer has sent an ACK response.
- ACCEPTED: The Consumer has accepted the latest Offer and the Provider has sent an ACK response.
- AGREED: The Provider has accepted the latest Offer, sent an Agreement to the Consumer, and the Consumer has sent an ACK response.
- VERIFIED: The Consumer has sent an Agreement verification to the Provider and the Provider has sent an ACK response.
- FINALIZED: The Provider has sent a finalization message including his own Agreement verification to the Consumer and the Consumer has sent an ACK response. Data is now available to the Consumer.
- TERMINATED: The Provider or Consumer has placed the CN in a terminated state. A termination message has been sent by either of the Participants and the other has sent an ACK response. This is a terminal state.
- COUNTER-PROPOSAL: The contract negotiation is hold on the provider side waiting for a COUNTER-PROPOSAL from consumer party.


##### EDC implementations 
As there is no TCK (Technology Compatibility Kit) has been published, there is no implementation can "conform" to DSP. However, there is a work in progress and EDC does intend to pass the TCK when it is available. [Refer here](https://docs.internationaldataspaces.org/ids-knowledgebase/v/dataspace-protocol/contract-negotiation/contract.negotiation.protocol#id-1.2-state-machine)

#### Measured results
[TODO] Describe the measured results (quantitative results), if applicable. Rank the results according to the expected output, if applicable.

#### Notes
[TODO] Add notes, if necessary.
