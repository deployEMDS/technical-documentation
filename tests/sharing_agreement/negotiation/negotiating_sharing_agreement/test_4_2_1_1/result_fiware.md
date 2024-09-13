## [4.2.1.1] Sharing agreement: Negotiation - Negotiating sharing agreement

### Stack: Fiware

### Statement of assessment

#### Environment

The test environment Fiware v0.2 was used as described in [Fiware Deployment v0.2](/deployment/fiware/README.md)

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

The test aims to assess the state machine implementation of the EDC ecosystem regarding the sharing negotiation.

### Results

#### Assessment

According to [TMF622 Product Ordering Management API User Guide](https://www.tmforum.org/resources/specifications/tmf622-product-ordering-management-api-user-guide-v5-0-0/)
a product order can be in the states:

- Acknowledged
- Rejected
- Pending
- InProgress
- Held
- AssessingCancellation
- PendingCancellation
- Cancelled
- Completed
- Failed
- Partial

#### Measured results

The current example only deals with placing the order with a request sent by the customer:

```sh
curl -v -X POST "${tmf_api_complete_url}/tmf-api/productOrderingManagement/v4/productOrder" \
   -H 'Accept: */*' \
   -H 'Content-Type: application/json' \
   -H "Authorization: Bearer ${SERVICE_ACCESS_TOKEN}" \
   -d "{
       \"productOrderItem\": [
         {
           \"id\": \"random-order-id\",
           \"action\": \"add\",
           \"productOffering\": {
             \"id\" :  \"${OFFER_ID}\"
           }
         }  
       ],
       \"relatedParty\": [
         {
           \"id\": \"${FANCY_MARKETPLACE_ID}\"
         }
       ]}"
```

Therefore, it is unclear how the transition of states is handled. Especially:

- How a state change is triggered?
- By whom a state change is triggered?
- What effect does a state change or the state of an order item in general have to other components in the ecosystem?

There are no components that negotiate a state as mentioned in the test description.

In the current implementation of the FIWARE Connector and its components, the negotiation state is only minimally covered by having an entity that holds the state.

**Functional suitability quality metric: 1**

#### Notes

To consume an ordered product, a provider has to provide access to the consumer to that product.
This is done by issuing a VC to the consumer that is accepted by the Policy Decision Point (PDP) of the provider and registering the issuer of the VC in the Trusted Issuer Registry (TIR) that is used by the providers' VCVerifier.
In the current setup, there seems to be no relation between the state of a product ordering and the act of enabling access to a resource as described before.