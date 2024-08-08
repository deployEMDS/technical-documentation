## [4.2.1.6] Sharing Agreement: Negotiation - Negotiating Sharing Agreement

### Stack: EDC+VC

### Statement of Assessment

#### Environment
- The test utilizes the EDC MVD commit [9a5f93c](https://github.com/eclipse-edc/MinimumViableDataspace/commit/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12).
- The test is executed in an Ubuntu environment using IntelliJ.

#### Tested Quality Metric and Method
The test quality is based on the metric defined in [iso27001_kpis_subkpis.xlsx](../../../../../design_decisions/background_info/iso27001_kpis_subkpis.xlsx). For the current phase (Phase 1), the test focuses on the Functional Suitability quality metric.

#### Comparative Criteria
[TODO] Describe the comparative criteria used for the test/assessment. If possible, align with the criteria used for the same test in other stack(s).

#### Expected Output
The test aims to assess whether the data sharing protocol is compatible with channel encryption (e.g., TLS) and whether connector authentication has occurred solely for the purpose of data sharing negotiation.

### Results

#### Assessment

##### Channel Encryption
Currently, all communication in MVD uses HTTP, and the data is transmitted in plain text. However, based on [EDC security recommendations](https://github.com/eclipse-edc/docs/blob/b757401a28da64a61f8c95a6d471932c3367980d/developer/best-practices.md#1-security-recommendations), there is no technical limitation preventing the use of EDC components within an encrypted channel, such as with TLS enabled, or behind a load balancer or API gateway. While it is generally advised to handle HTTPS/SSL/TLS termination through deployment mechanisms such as Kubernetes or an API gateway, EDC also provides an extension for Direct SSL Termination in the Connector Runtime, available at [Jetty-core](https://github.com/eclipse-edc/Connector/tree/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/extensions/common/http/jetty-core).

##### Connector Authentication
The MVD implementation uses [Token Based Authentication Service](https://github.com/eclipse-edc/Connector/tree/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/extensions/common/auth/auth-tokenbased) to secure connector APIs, configured by the key [EDC_API_AUTH_KEY](https://github.com/eclipse-edc/MinimumViableDataspace/blob/9a5f93c89cf5624cc4bf8eaa024a29da9b8e3d12/deployment/assets/env/consumer_connector.env#L15). EDC provides an [AuthenticationService](https://github.com/eclipse-edc/Connector/blob/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/spi/common/auth-spi/src/main/java/org/eclipse/edc/api/auth/spi/AuthenticationService.java#L25) for integrating authentication protection into the APIs. Additionally, out-of-the-box extensions are available from EDC [here](https://github.com/eclipse-edc/Connector/tree/0bb741787fd0abc2a6a8a883a6fafdbf3b795c29/extensions/common/auth).

#### Measured Results
As mentioned above, EDC provides out-of-the-box extensions for TLS integration and Connector API authentication.

**Functional Suitability Quality Metric: 4**

#### Notes
EDC is a pluggable ecosystem primarily targeting Java/Kotlin developers. Some extensions are available on the market for plug-and-play, but for certain specific use cases, developers need to create their own extensions.
