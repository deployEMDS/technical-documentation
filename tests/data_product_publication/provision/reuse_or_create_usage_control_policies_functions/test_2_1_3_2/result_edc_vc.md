## [2.1.3.2] Data product publication: Provision - Reuse or create usage control policies / functions

https://github.com/imec-int/deployEMDS/issues/167

### Stack: EDC+VC

### Statement of assessment

#### Environment

- EDC MVD https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12

#### Tested quality metric and method

The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx)
For current phase (phase 1), the test focus on the Functional suitability quality metric.

#### Expected output

The test aims to assess the ease of use of deploying Usage Control Policies in regards to the availability of a user interface.

### Results

#### Assessment

Policy implementation as well as definitions are not part of the EDC connector itself. The reasons for this is because policies are highly dependent on the specific use case and the specific requirements of the data space - it is not possible to create a generic abstraction that would cover all possible use cases.

The EDC connector ships with a [policy engine](https://github.com/eclipse-edc/Connector/blob/main/docs/developer/policy-engine.md) which orchestrates the execution of programmatically registered policy rules throughout the lifecycle of the connector state machine.

EDC in an MVD configuration does not offer a user interface for deployment of usage policies. Such interface can be created as an extension to the [existing UI](https://github.com/eclipse-edc/DataDashboard) or as a separate application.

The EDC API can be used to deploy usage policies programmatically but only for already supported policy functions.

The EDC extensibility model can be used to add custom policy enforcement functions, as well as expand the scopes and actions that can be used in the policies.

A very simple example bellow illustrates the implementation logic for specific policy that only allows the usage of an asset if sufficient time has passed:

```kotlin
class TimeIntervalFunction(private val monitor: Monitor, private val transferProcessStore: TransferProcessStore) :
    AtomicConstraintFunction<Permission> {
    // p1 is the value of the constraint
    override fun evaluate(p0: Operator?, p1: Any?, p2: Permission?, p3: PolicyContext?): Boolean {
        monitor.info("Checking timeInterval constraint")
        when (p0) {
            Operator.EQ -> {
                // will throw if not a valid duration
                val duration = Duration.parse(p1.toString())
                p3?.getContextData(ContractAgreement::class.java)?.let {
                    val agreementId = it.id
                    val querySpecBuilder = QuerySpec.none().toBuilder()
                    val criterion = criterion("contractId", "=", agreementId)
                    // updatedAt is not present it seems
                    querySpecBuilder.filter(criterion).sortField("createdAt").sortOrder(SortOrder.DESC)
                    val transferProcesses = transferProcessStore.findAll(querySpecBuilder.build())
                    transferProcesses.findFirst().getOrNull()?.let {
                        val timeDiff = Duration.between(Instant.ofEpochMilli(it.createdAt), Instant.now())
                        monitor.info("Last transfer was ${it.id}, ${timeDiff.toMinutes()} minutes ago")
                        if (timeDiff < duration) {
                            return false
                        }
                    }
                    return true
                }
            }
            else -> throw IllegalArgumentException("Only 'eq' operator is supported for timeInterval constraint")
        }
        return false
    }
}
```

Currently, the EDC core provides 3 different policy scopes:

- `all` - policy functions will be used for every policy evaluation

- `contract.cataloging` - This scope is used when contract offers are generated from contract definitions.

- `contract.negotiation` - This scope is used during the contract negotiation.

- `provision.manifest.verify` - This scope is used during the provisioning phase to evaluate the resource definitions of a generated resource manifest.

More informnation on scopes can be [found here](https://github.com/eclipse-edc/Connector/blob/main/docs/developer/policy-engine.md#policy-scopes).

Policies can be implemented as `ServiceExtension` which upon initialization are registered to be evaluated for a specific scope. More details are available in the [EDC documentation](https://eclipse-edc.github.io/docs/#/submodule/Connector/docs/developer/policy-engine?id=step-2-implement-a-serviceextension). For example, a ServiceExtension to register the above time interval function can be:

```kotlin
class PolicyFunctionsExtension : ServiceExtension {
    @Inject
    private val ruleBindingRegistry: RuleBindingRegistry? = null

    @Inject
    private val policyEngine: PolicyEngine? = null

    @Inject
    private val transferProcessStore: TransferProcessStore? = null

    override fun name(): String {
        return "Policy functions for timeInterval restricted usage"
    }

    override fun initialize(context: ServiceExtensionContext) {
        val monitor = context.monitor
        monitor.info("Registering the policy functions extension")
        ruleBindingRegistry!!.bind(USE_ACTION, PolicyEngine.ALL_SCOPES)
        // for every registered operand, we need to provide an implementation,
        // otherwise exceptions will be thrown
        ruleBindingRegistry.bind(TIME_INTERVAL, TRANSFER_SCOPE)
        policyEngine!!.registerFunction(
            TRANSFER_SCOPE,
            Permission::class.java,
            TIME_INTERVAL,
            TimeIntervalFunction(monitor, transferProcessStore!!),
        )
    }

    companion object {
        val USE_ACTION = "use"
        val TIME_INTERVAL = "timeInterval"
    }
}
```

Depending on the scope, custom policy functions are executed as part of the lifecycle of the connector state machine and receive the corresponding state of the connector as input.

The policy implementation is not validated or checked by the EDC connector itself. Any checks should be implemented in the policy function itself as needed.

#### Measured results

While the connector offers a very flexible approach to introducing policies and control within a database, it does so in a way that requires a deep understanding of the connector's lifecycle and the allocation of software development resources. The lack of a user interface for policy deployment is a significant drawback for users who are not familiar with the connector's internals or for projects aiming to bootstrap a data space quickly.

**Functional Suitability Quality Metric: 1**

#### Notes

For demo purpose as part of the `health-data-space` project, we had previously implemented a custom policy enforcing function.
