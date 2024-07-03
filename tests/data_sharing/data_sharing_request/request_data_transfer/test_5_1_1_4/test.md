
## [5.1.1.4] Data sharing: Data sharing request - Request data transfer
 
### Test description
Smoke test: initiate a slow consumer data sharing and break the connection. Assess the state of both the producer and consumer systems and how they manage and log the fault.
 
### Test type
Test
 
### Execution phase
Phase 1
 
### Minimal?
No
 
### Extra information
#### ISO25010 Quality
Reliability
#### ISO25010 Quality description
[Recoverability] The system provides a recovery mechanism of the transferring session.
[Faultlessness] The system supports asynchronous or long-running data sharing executions, with variable throughput and response times. 
    