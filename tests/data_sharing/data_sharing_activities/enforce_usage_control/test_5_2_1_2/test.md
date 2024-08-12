
## [5.2.1.2] Data sharing: Data sharing activities - Enforce usage control
 
### Test description
Test whether tracing of policy evaluation/observability is supported out of the box. (e.g.: creation, publication, assignment, enforcement, result of enforcement) 
For the policies that are not supported, describe the effort of how to build them, and rank the system consequently (e.g.: create a plugin in a documented environment ranks better than integrating an external function that introduces dependencies and interface maintenance)."
 
### Test type
Coverage
 
### Execution phase
Phase 1
 
### Minimal?
Yes
 
### Extra information
#### Comparative criteria (checklists, ...)
| Criteria           | Scoring          |
| ------------- | ------------- |
| No policies  | 0 |
| No out-of-the-box observability on policies, no documented way to implement tracing | 1 |
| No out-of-the-box observability on policies, documented way to implement tracing  | 2 |
| Out-of-the-box observability on policies, custom format  | 3 |
| Out-of-the-box observability on policies, uses well known tracing format (e.g., Open tracing)  | 4 |
| As above + developer documentation   | 5 |

#### ISO25010 Quality
Maintainability
#### ISO25010 Quality description
[Analysability] The system can be configured to persist the outcome of policy evaluation in a log, or to an observability tracing system. 
    