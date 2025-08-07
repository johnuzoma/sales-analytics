### Overview
This personal project demonstrates how to ingest raw sales data from Amazon S3 into Snowflake, process and transform it using dbt, and exposes business insights via a Looker dashboard.

### Key Features
- Scalable cloud-based architecture
- dbt snapshots with SCD Type 2 implementation
- Source and transformation data testing
- End-to-end data lineage and version control
- Business-ready analytics in Looker

### High Level Architecture
<img width="907" height="399" alt="sales_analytics drawio" src="https://github.com/user-attachments/assets/70296a1b-b844-40af-880f-ad1d099e2638" />

### Tech Stack
- Amazon S3:	Source system for raw sales data
- Python:	Data ingestion from S3 to Snowflake
- Snowflake:	Cloud data warehouse for storage and computation
- dbt (data build tool):	Data transformation, testing, and modeling (fact, dimensions, SCD)
- Looker:	BI visualization and dashboarding

### Data Lineage in dbt
![lineage](https://github.com/user-attachments/assets/97407f35-6523-40f1-92bc-34e1070665f5)

### Looker Dashboard
![looker report](https://github.com/user-attachments/assets/e15596d8-cdde-4278-aa57-f95d51002c26)

### Implementation Steps 

##### Data Ingestion
- Configured a Snowflake storage integration and external stage to securely ingest data from S3.

- Loaded raw sales data into Snowflake using Python and Snowpark.

##### Data Testing & Modeling with dbt
- Integrated Snowflake with dbt for declarative data transformation.

- Validated raw source data using:

  - Freshness tests
  - Accepted values and null tests
  - Custom data tests such as ensuring no future dates, only 1 salesperson per lead, and that date of lead acquisition shouldn't be greater than close date.

##### Built a modular dbt project with a layered architecture:

- Staging models to clean and standardize source data

- Fact and dimension tables in the Mart layer

- Ensured data quality through transformation-level tests.

- Snapshots to implement Slowly Changing Dimension (SCD) Type 2 tracking when a salesperson for a lead is changed.

##### Business Insights with Looker
- Connected Looker to the Snowflake warehouse.
- Created interactive dashboards visualizing key sales metrics:
  - Top-performing salespeople based on opportunity volume
  - Revenue distribution by region
  - Opportunity generation by customer segment
