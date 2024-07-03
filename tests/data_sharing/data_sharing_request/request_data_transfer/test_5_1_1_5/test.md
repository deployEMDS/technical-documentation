
## [5.1.1.5] Data sharing: Data sharing request - Request data transfer
 
### Test description
Assessment or smoke test: assess two use cases: 1) many clients performing data sharing requests on the same data product. 2) (Optional) many clients performing many sharing requests on the same provider connector. If the system requires autoscaling through external load balancing, test how sessions are supported and rank reliability. If the system supports only vertical scaling, rank if it could undergo disruptions during scaling.
 
### Test type
Assessment
 
### Execution phase
Phase 1
 
### Minimal?
No
 
### Extra information
#### ISO25010 Quality
Performance efficiency
#### ISO25010 Quality description
[Scalability] The system can scale to support increasing numbers of active long-running requests.
    