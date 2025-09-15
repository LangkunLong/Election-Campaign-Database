# Optimized Embedded-SQL Project
# Election Campaign Database

Updated query to avoid redundunt SQL calls; Updated Schema design to improve garbage route efficiency 
## Overview
This project defines a PostgreSQL schema for tracking election campaigns, participants, debates, and donations. It includes sample data and example queries that demonstrate how to analyze campaign information.

## Schema
The `schema.ddl` file creates the `Election` schema and its tables:
- **ElectionCampaigns** – uniquely identified by `campaign_id` with a non‑negative `spending_limit` constraint.
- **Volunteer** – references `ElectionCampaigns` and uses `(volunteer_email, start_time, end_time)` as a composite primary key. Each volunteer record must specify a `campaign_activity` of either `phone banks` or `door-to-door canvassing`.
- **Donor** – records donations to campaigns. The primary key combines `donor_email`, `donor_campaign_id`, `donate_amount`, and `donation_type`. Donations must be non‑negative and labeled as either `Individual` or `Organization`.
Additional tables capture candidates, staff members, debate moderators, debates, and the participation of candidates in debates.

## Queries
`queries.sql` demonstrates typical analyses:
1. **Totals by donation type** – sums organization and individual contributions for each campaign.
2. **Volunteers in every campaign** – identifies volunteers who signed up for all campaigns in the dataset.
3. **Candidates in every debate** – finds candidates who appear in every recorded debate.

## Sample Data
`instance.sql` populates the schema with example campaigns, candidates, volunteers, staff, debates, and donors so the queries can be executed immediately.

## Running the project
1. Create the schema:
   ```bash
   psql -f schema.ddl
   ```
2. Load the sample data:
   ```bash
   psql -f instance.sql
   ```
3. Execute the example queries:
   ```bash
   psql -f queries.sql
   ```
Each script sets the search path to the `election` schema.

## License/Attribution
Provided for academic purposes as part of CSC343 (University of Toronto).
Please review the original course license terms before reusing this code.
