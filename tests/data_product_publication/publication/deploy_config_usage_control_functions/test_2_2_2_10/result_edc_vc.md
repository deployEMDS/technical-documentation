## [2.2.2.10] Data product publication: Publication - Deploy/config usage control functions
### Stack: EDC+VC

### Statement of assessment
#### Environment

EDC Connector v.0.7.1 within a local testbed.

#### Tested quality metric and method

The policies language allows development of new operators to support new models of consumption and constraints.

### Results
#### Assessment

The EDC leverages the Open Digital Rights Language (ODRL) standard for its policy language.
ODRL is designed to express rights and conditions related to the use of digital content.
This standard offers a structured way to define and enforce usage policies through a set of well-defined terms and concepts.

The standard also defines ODRL Profiles [[1](https://www.w3.org/TR/odrl-model/#terminology), [2](https://www.w3.org/TR/odrl-model/#profile)], a mechanism to extend the standard vocabulary to meet specific domain requirements.
By defining an ODRL Profile, users can introduce new actions, constraints, and operators that are tailored to their specific needs and are not part of the default ODRL vocabulary.

Any new ODRL Profile should follow the [best practices](https://w3c.github.io/odrl/profile-bp/) defined by the [ODRL community group](https://www.w3.org/community/odrl/).
Applying a new ODRL profile entails the use of a custom policy enforcement function (see related [Test 2.2.2.4](https://github.com/imec-int/deployEMDS/issues/194)).

Existing profile examples from the ODRL community group include
- [ODRL Profile: Big Data](https://w3c.github.io/odrl/profile-bigdata/), with a [Machine Learning (ML) agreement example](https://w3c.github.io/odrl/profile-bigdata/#x2-how-to-represent-an-obligation)
- [ODRL Temporal Profile](https://w3c.github.io/odrl/profile-temporal/)

For instance, the ML example uses actions (`train` and `KillJob`) and parties (`consumer` and `provider`) defined by ODRL Data Usage Control (DUC), a profile focused on data processing over big data systems.

```
{
   "@context": "http://www.w3.org/ns/odrl.jsonld",
   "@type": "Agreement",
   "uid": "http://example.com/policy:1010",
   "duc:provider": "http://oem.com/ids#me",
	  "permission": : [{
		  "duc:consumer": "http://supplier.com/"",
	  "target": "http://oem.com/ids/inventory/dataset-1",
	  "action": "duc:train"",
	  }],

   "obligation": [{
	  "@type": "Duty",
	  "target": "http://oem.com/ids/inventory/dataset-1",
	  "action": "inform",
	  "consequence": [{
	  "target": "http://oem.com/ids/inventory/dataset-1",
		  "action":[{
			  "rdf:value": { "@id": "duc:KillJob" },
			  "refinement": [{
				  "leftOperand": "recipient",
				  "operator": "eq",
				  "rightOperand": {
					  "@value": "flinkid00",
					  "@type": "http://orion.fiware.org/Job"
					  }
				  }]
			  }]
		  }]
	  }],
	  "prohibition": [{
	  "assignee": "http://supplier.com/",
	  "target" : "http://oem.com/ids/inventory/dataset-1",
	  "action": "print"
	  }]
}
```

The resulting agreement can be translated as follow

```
Company A wants to share a dataset to Company B.
Company A only allows Company B to use the data for generating a ML model.
Company B can not transfer any data to internal or external parties
```

In conclusion, although the policy language can be extended as described, these operations exceed the current capabilities of the available API.
Additionally, a deep understanding of ODRL and ODRL Profiles is necessary to effectively expand the default set of operations provided by the policy.
Finally, this complexity surpasses the abilities of a non-technical profile.

#### Measured results

The criteria used to measure the results was the one specified by the Data Product Publication ISO25010 Quality file regarding Flexibility.

| **Criterion**      | **Description**                                                                 | **Score (0-4)** | **Explanation** |
|--------------------|---------------------------------------------------------------------------------|-----------------|-----------------|
| **Adaptability**   | Adaptability for different or evolving hardware, software, or usage environments. | 4               | 
The ODRL policy language is versatile enough easily adapt to these changes. |
| **Installability** | The components of the platform are successfully installed and/or uninstalled in a specified environment. | 3               | Extensive installation documentation is available to the user. |
| **Replaceability** | Replacement of the components for the same purpose in the same environment.       | 3               | High modularity of the ODRL policy language. |
| **Scalability**    | The product can handle growing to adapt its capacity.                             | 3               | ODRL testing is non-trivial and may require ad-hoc environments. |

Functional Suitability Quality Metric Score: 3.25 (arithmetic mean of criterions scores)
