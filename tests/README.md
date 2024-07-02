The folder contains the actual test descriptions and their results.
Definitions and deliverables and are organized in a tree that reflects the project's common nomenclature. 


```.
|-  Business capabilities (i.e. data_product_publication)
|  |-- Customer journeys (i.e. provision)
|  |  |-- Sub-customer journeys (i.e. data_source_endpoint_provisioning)
|  |  |  |--Test number# (i.e. test_2_1_1_1)
|  |  |  |  |-- test.md (the description of the test)
|  |  |  |  |-- test-result-facilityA.md (report on methods and results of the test within a facility, i.e. test-result-edc_vc.md)
|  |  |  |  |-- test-result-facilityB.md (as above, within another facility, i.e. test-result-fiware.md)
|  |  |  |  |-- code-facilityA (For automated or machine-aided tests, i.e. code-edc_vc)
|  |  |  |  |  |-- Any test asset (no assumptions on organization of this folder)
|  |  |  |  |-- code-facilityB (i.e. code-fiware)
|  |  |  |  |-- resources-facilityA (assets, configs, media, DRM material, etc., i.e. resources-edc_vc)
|  |  |  |  |  |-- any other asset needed for testing
|  |  |  |  |-- resources-facility B (i.e. resources-fiware)
```

The structure will be used to implement comparative reviews to align the results of testing facilities. For this reason, it is advisable to follow the publication guidelines, although improvements are always welcome, and they can be requested via issues.
