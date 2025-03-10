## [1.3.1.1A] Participant onboarding: Certification - Identity and credentials issuance

### Stack: EDC+VC

### Statement of assessment

#### Environment

- [EDC IdentityHub 0.8.0](https://github.com/eclipse-edc/IdentityHub)
- [Gaia-X VC Wizard](https://wizard.lab.gaia-x.eu/)
- [EDC- MinimumViableDataspace: 2c7701](https://github.com/eclipse-edc/MinimumViableDataspace/commit/2c7701cdf019f46cf671d99252248929bda113ce)
- [Local deployment with MVD .run](https://github.com/eclipse-edc/MinimumViableDataspace/tree/main/.run)

#### Tested quality metric and method

The quality metric for this test is based on the criteria outlined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). In Phase 1, the focus is on the Functional Suitability metric. For detailed information, please refer to the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria-checklists-) section in the test description.

#### Expected output

**The expected output of this test is to evaluate the level of customization required to integrate Gaia-X issued VC to
EDC Ecosystem**

### Test procedure

1. Generate a self-issued (Not Signed) VC using the [Gaia-X VC Wizard](https://wizard.lab.gaia-x.eu/)
   with `IMEC VAT Identifier`.

```json
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://w3id.org/security/suites/jws-2020/v1",
    "https://registry.lab.gaia-x.eu/development/api/trusted-shape-registry/v1/shapes/jsonld/trustframework#"
  ],
  "type": ["VerifiableCredential"],
  "id": "did:web:wizard.lab.gaia-x.eu:api:credentials:2d37wbGvQzbAQ84yRouh2m2vBKkN8s5AfH9Q75HZRCUQmJW7yAVSNKzjJj6gcjE2mDNDUHCichXWdMH3S2c8AaDLm3kXmf5R8DWA1SrzhRkGLQLXtXP852M7hoH5hPXGueYtSN6cWyvnrXGkEYnXxDojTAVkCe44TbAPCXzgryYv33pwdVYxMoD1VDrMv9g6WksqPg6Ab76NNqEBPQR6Ncw8suXEGyMUqyZ53zrv1WNhmbNA8mt53AdL7WouUwX97gSuo5gYeBCNhbHULH2z8P1fFLCvWwTLj1Mh99fEtcdwzUeKZ9nXE7ULVvSmB9XLycHA59ArGK95ffgtTqpsVZ5DWBLEExPivNuNsBx2B5QzQDTcyucLgfnZXUXDW5A2jDgTJuAn5YQxkr6zcdvhX7jR8jbttZYYfEcRAgCNpF2tWFSBNHP3HNmjhHESHSjdRiCGPCGZ5VoRi7d9EFX3xPy8uXooe5pB5WTZAzmReFdDJZJnamFmY47VL36A8Hs5AxLKVbSBtnHMPZbSVvQgZnRMhPCJZyQEdLJj8xVdegcfx1B75vrst1e5ipyRKJsKxDHkHb6VHBB1h6fp7PskbJFDHGNAvdm8VSxccn8?uid=600f377a-ac0e-4628-abc6-334352861bf9",
  "issuer": "did:web:wizard.lab.gaia-x.eu:api:credentials:REDACTED",
  "issuanceDate": "2024-07-17T13:39:37.965Z",
  "credentialSubject": {
    "gx:legalName": "IMEC",
    "gx:headquarterAddress": {
      "gx:countrySubdivisionCode": "BE-LEU"
    },
    "gx:legalRegistrationNumber": {
      "id": "https://wizard.lab.gaia-x.eu/api/credentials/2d37wbGvQzbAQ84yRouh2m2vBKkN8s5AfH9Q75HZRCUQmJW7yAVSNKzjJj6gcjE2mDNDUHCichXWdMH3S2c8AaDLm3kXmf5R8DWA1SrzhRkGLQLXtXP852M7hoH5hPXGueYtSN6cWyvnrXGkEYnXxDojTAVkCe44TbAPCXzgryYv33pwdVYxMoD1VDrMv9g6WksqPg6Ab76NNqEBPQR6Ncw8suXEGyMUqyZ53zrv1WNhmbNA8mt53AdL7WouUwX97gSuo5gYeBCNhbHULH2z8P1fFLCvWwTLj1Mh99fEtcdwzUeKZ9nXE7ULVvSmB9XLycHA59ArGK95ffgtTqpsVZ5DWBLEExPivNuNsBx2B5QzQDTcyucLgfnZXUXDW5A2jDgTJuAn5YQxkr6zcdvhX7jR8jbttZYYfEcRAgCNpF2tWFSBNHP3HNmjhHESHSjdRiCGPCGZ5VoRi7d9EFX3xPy8uXooe5pB5WTZAzmReFdDJZJnamFmY47VL36A8Hs5AxLKVbSBtnHMPZbSVvQgZnRMhPCJZyQEdLJj8xVdegcfx1B75vrst1e5ipyRKJsKxDHkHb6VHBB1h6fp7PskbJFDHGNAvdm8VSxccn8#279da7e31cce892065abd510920db68bc5996d55f4432763d16a407590115e94"
    },
    "gx:legalAddress": {
      "gx:countrySubdivisionCode": "BE-LEU"
    },
    "type": "gx:LegalParticipant",
    "gx-terms-and-conditions:gaiaxTermsAndConditions": "70c1d713215f95191a11d38fe2341faed27d19e083917bc8732ca4fea4976700",
    "id": "did:web:wizard.lab.gaia-x.eu:api:credentials:2d37wbGvQzbAQ84yRouh2m2vBKkN8s5AfH9Q75HZRCUQmJW7yAVSNKzjJj6gcjE2mDNDUHCichXWdMH3S2c8AaDLm3kXmf5R8DWA1SrzhRkGLQLXtXP852M7hoH5hPXGueYtSN6cWyvnrXGkEYnXxDojTAVkCe44TbAPCXzgryYv33pwdVYxMoD1VDrMv9g6WksqPg6Ab76NNqEBPQR6Ncw8suXEGyMUqyZ53zrv1WNhmbNA8mt53AdL7WouUwX97gSuo5gYeBCNhbHULH2z8P1fFLCvWwTLj1Mh99fEtcdwzUeKZ9nXE7ULVvSmB9XLycHA59ArGK95ffgtTqpsVZ5DWBLEExPivNuNsBx2B5QzQDTcyucLgfnZXUXDW5A2jDgTJuAn5YQxkr6zcdvhX7jR8jbttZYYfEcRAgCNpF2tWFSBNHP3HNmjhHESHSjdRiCGPCGZ5VoRi7d9EFX3xPy8uXooe5pB5WTZAzmReFdDJZJnamFmY47VL36A8Hs5AxLKVbSBtnHMPZbSVvQgZnRMhPCJZyQEdLJj8xVdegcfx1B75vrst1e5ipyRKJsKxDHkHb6VHBB1h6fp7PskbJFDHGNAvdm8VSxccn8#6d9367bd0d7d3c21181acd57000beb8474dd4f1c4a004be812c24cfadaca697c"
  }
}
```

2. Deploy
   the [EDC- MinimumViableDataspace: 2c7701](https://github.com/eclipse-edc/MinimumViableDataspace/commit/2c7701cdf019f46cf671d99252248929bda113ce)
   to local environment inside IntelliJ IDEA.
   Mount the above-mentioned VC to the IdentityHub, by adding it under deployment assets of the MVD.
3. Spin up the EDC MVD, and query the IdentityHub API `/api/identity/v1alpha/credentials` to check if the VC is stored.

### Test result

The Identity Hub API returns the stored VC, and the returned payload is as follows:

```json
[
  {
    "participantId": null,
    "id": "did:web:wizard.lab.gaia-x.eu:api:credentials:2d37wbGvQzbAQ84yRouh2m2vBKkN8s5AfH9Q75HZRCUQmJW7yAVSNKzjJj6gcjE2mDNDUHCichXWdMH3S2c8AaDLm3kXmf5R8DWA1SrzhRkGLQLXtXP852M7hoH5hPXGueYtSN6cWyvnrXGkEYnXxDojTAVkCe44TbAPCXzgryYv33pwdVYxMoD1VDrMv9g6WksqPg6Ab76NNqEBPQR6Ncw8suXEGyMUqyZ53zrv1WNhmbNA8mt53AdL7WouUwX97gSuo5gYeBCNhbHULH2z8P1fFLCvWwTLj1Mh99fEtcdwzUeKZ9nXE7ULVvSmB9XLycHA59ArGK95ffgtTqpsVZ5DWBLEExPivNuNsBx2B5QzQDTcyucLgfnZXUXDW5A2jDgTJuAn5YQxkr6zcdvhX7jR8jbttZYYfEcRAgCNpF2tWFSBNHP3HNmjhHESHSjdRiCGPCGZ5VoRi7d9EFX3xPy8uXooe5pB5WTZAzmReFdDJZJnamFmY47VL36A8Hs5AxLKVbSBtnHMPZbSVvQgZnRMhPCJZyQEdLJj8xVdegcfx1B75vrst1e5ipyRKJsKxDHkHb6VHBB1h6fp7PskbJFDHGNAvdm8VSxccn8?uid=600f377a-ac0e-4628-abc6-334352861bf9",
    "timestamp": 0,
    "issuerId": null,
    "holderId": null,
    "state": 0,
    "timeOfLastStatusUpdate": null,
    "issuancePolicy": null,
    "reissuancePolicy": null,
    "verifiableCredential": null
  }
]
```

#### Comparative criteria (checklists, ...)

- Does the stack support VC?

- The stack supports self-issued VCs

- The stack supports self-issued VCs with support for SD classes?

- The stack supports self-issued VCs where SD classes don't break the VC manager, a GAIA-X compatible DID method can be used. No compliance or claim verification are mandatory, just a smoke test.

- The stack uses GAIA-X trust anchors. -> N/A, This test requires the setup of a GXDCH infrastructure that we don't have, yet.

- The stack has a service that verifies credential compliance and a connector has policies to ensure a participant has compliant GAIA-X descriptors -> N/A, requires GAIA-X infrastructure

- The stack implements policies that can use SD classes to interpret claims and use a GXDCH clearing house for business purposes -> N/A, requires GAIA-X infrastructure

### Results

- As previously mentioned, the Gaia-X generated VC does not cause any EDC component to crash and can be integrated with
  the Identity Hub without issues.
- However, the Gaia-X VC lacks fields expected by the Identity Hub, such as
  participantId.
- Additionally, Identity Hub is unable to properly parse the Gaia-X VC because there is no issuance flow implemented yet. The IdentityHubExtension#seedCredentials() extension, used as a workaround to seed credentials for mocking the issuance flow, cannot parse Gaia-X credentials. This is evident from the improperly parsed credentials in the response payload from the Identity Hub API.
  However, EDC supports LDP-VC and LDP-VPs if the credential can be seeded correctly, with certain limitations regarding the supported signature suites and the intermixing of LDP-VC and JWT-VCs. Identity Hub uses the VC 1.1 data model for LDP-VCs.
- To support parsing of Gaia-X VC, `VerifiableCredentialResource` needs to be adapted.
- Moreover, there is no out-of-the-box solution from EDC for resolving the DID method used by Gaia-X VC, and the VC
  issuance flow is also currently missing in the Identity Hub.

#### Assessment result

Based on the criteria outlined in the [Comparative criteria (checklists, ...)](./test.md#comparative-criteria) section of the test description, the test is assigned the following score:

[x] Does the stack support VC? - PASS

[x] The stack supports self-issued VCs - PASS

[x] The stack supports self-issued VCs with support for SD classes? - PASS

[X] The stack supports self-issued VCs where SD classes don't break the VC manager, a GAIA-X compatible DID method can
be used. No compliance or claim verification are mandatory, just a smoke test. - PASS, but EDC cannot parse the VC.

[] The stack uses GAIA-X trust anchors. -> N/A, This test requires the setup of a GXDCH infrastructure that we don't
have, yet. EDC doesn't have an open-box solution for integrating Gaia-X trust anchor.

[] The stack has a service that verifies credential compliance and a connector has policies to ensure a participant has
compliant GAIA-X descriptors -> N/A, requires GAIA-X infrastructure. EDC doesn't have an open-box solution for
integrating Gaia-X trust anchor.

[] The stack implements policies that can use SD classes to interpret claims and use a GXDCH clearing house for business
purposes -> N/A, requires GAIA-X infrastructure. EDC doesn't have an open-box solution for integrating Gaia-X trust
anchor.

#### Functional suitability quality metric: 2

#### Notes

- EDC components are plugin-based. Support for various verifiable credential formats is possible by implementing a plugin (this applies to both decentralized as well as centralized solutions). For example, support for web DID resolution is just a preview of a method that can be created. See [docs](https://github.com/eclipse-edc/Publications/blob/main/Identity%20Management/DID_EDC.md).
- EDC ecosystem primarily targets Java/Kotlin developers. Some extensions are available on the market for plug-and-play,
  but for certain specific use cases, developers need to write their own extensions.
