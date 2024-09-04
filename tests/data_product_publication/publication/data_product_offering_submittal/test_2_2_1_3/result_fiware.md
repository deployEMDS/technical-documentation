## [2.2.1.3] Data product publication: Publication - Data product offering submittal
### Stack: Fiware

### Statement of assessment
#### Environment


#### Tested quality metric and method

Has the data producer access (via GUI or API) to overviews of

- Data products offerings
- Sharing agreements
- Available data planes

### Results

#### Data products offerings

A product offering is made available by configuring a route for that product (and additional plugins, e.g. for PEP) in the APISIX.
Therefore, the data producer can see all the data products loaded into the connector via API and via the [APISIX Dashboard > Routes](http://apisix-dashboard-ntt.demo-portal.eu/routes/list)

Functional Suitability Quality Metric Score: 4

#### Contract agreements

Contracting is managed outside the FIWARE connector.

Functional Suitability Quality Metric Score: 0

#### Catalog

The NGSI-LD catalog is used to publish offerings. The catalog has a featureful API, but does not have a GUI.

Functional Suitability Quality Metric Score: 2

#### Transfer processes

The transfer process spans multiple components (e.g. APISIX Gateway, PEP, data backend). 
Each of these components has a log that can be consulted to find out a state of the transfer or why it might have failed.
However, there is no general overview of a transfer process provided neither by GUI nor with an API.

Functional Suitability Quality Metric Score: 1

#### Available data planes

Data planes are basically APISIX plugins. The user can see the plugins available in the [APISIX Global Plugin List](http://apisix-dashboard-ntt.demo-portal.eu/plugin/market)
The available Plugins are also listed in the [APISIX Plugin Hub](https://apisix.apache.org/plugins/)

Functional Suitability Quality Metric Score: 4

#### Contract definitions

Contracting is managed outside the FIWARE connector.

Functional Suitability Quality Metric Score: 0

#### Contract negotiations

Contracting is managed outside the FIWARE connector.

Functional Suitability Quality Metric Score: 0
