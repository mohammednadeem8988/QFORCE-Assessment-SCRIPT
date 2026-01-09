# QFORCE-Assessment-SCRIPT

Automation Flow
- Login to Salesforce
- Create Lead with random First Name, Last Name
- Company generated using Faker
- Lead Source set to Web
- Save Lead record
- Validate Lead Status and Owner
- Handle duplicate lead popup gracefully
- Clean teardown

### Assumptions
- Salesforce URL, Username, and Password are provided via environment variables
- FakerLibrary is available in the project
- Logged-in user has permission to create Leads
- Default Lead Status for a new Lead is Open
