
## [5.2.1.1] Data sharing: Data sharing activities - Enforce usage control
 
### Test description
Test the policies that are supported out of the box.  
For the policies that are not supported, describe the effort of how to build them, and rank the system consequently (e.g.: create a plugin in a documented environment ranks better than integrating an external function that introduces dependencies and interface maintenance).
 
### Test type
Coverage + Assessment
 
### Execution phase
Phase 1
 
### Minimal?
Yes
 
### Extra information
#### Comparative criteria (checklists, ...)
| Criteria           | Scoring          |
| ------------- | ------------- |
| No out of the box policies  | 0 |
| No out of the box policies but policies are available from a library  | 1 |
| Partial out-of-the-box-policies  | 2 |
| Full set of out-of-the-box policies  | 3 |
| Documented way to create/expand policies  | +1 |
| Documented way to create/expand policies + templates for basic polices   | +2 |

#### ISO25010 Quality
Functional suitability
#### ISO25010 Quality description
[Functional completeness] The system provides a PEP function that supports usage control policies of classes: Allow-usage, Role-restricted, Connector-restricted, Purpose-restricted, Interval-restricted, Location-restricted, Log-usage-of-data. (see IDSA Position Paper on Usage Control). 
    