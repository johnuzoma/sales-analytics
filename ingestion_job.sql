CREATE OR REPLACE PROCEDURE PRACTICE.SALES.INGESTION_JOB()
RETURNS VARCHAR(16777216)
LANGUAGE PYTHON
RUNTIME_VERSION = '3.11'
PACKAGES = ('snowflake==1.0.2','snowflake-snowpark-python==*')
HANDLER = 'main'
EXECUTE AS OWNER
AS '# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col

def main(session: snowpark.Session):     
    stage_name = "practice.sales.salesdata"
    stage_path = f"@{stage_name}/"

    # apply error handling using try/except, in case the stage cannot be created or replaced
    try:
        # create or replace stage, then load S3 data into it
        session.sql(
            f"""
            CREATE OR REPLACE STAGE {stage_name}
                STORAGE_INTEGRATION = s3_data_integration
                URL = ''s3://[BUCKETNAME]/salesdata.csv''
                FILE_FORMAT = (TYPE=CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1);
            """
        ).collect()
    except Exception as e:
        print(f"Error creating/replacing stage for salesdata.csv: {e}")

    # validate the existence of csv file
    if has_csv_file(session, stage_path):         
        # read csv data from stage into a DataFrame
        df = session.read.csv(stage_path)    
            
        # save dataframe as a table
        df_prepared.write.mode("overwrite").save_as_table(f"practice.sales.raw_sales")
    else:
        print(f"No csv file found in {stage_path}. Please check source system.")
   
    return "End of ingestion"

def has_csv_file(session: snowpark.Session, stage_path: str) -> bool: 
    # apply error handling using try/except, in case the stage doesn''t exist or is inaccessible
    try:
        # attempt to list file in the specified stage
        result = session.sql(f"LIST {stage_path};").collect()
    
        # check if the file have the ".csv" extension
        has_csv = any(row.name.endswith(''.csv'') for row in result)   
        return has_csv   
    except Exception as e:
        print(f"Error accessing stage {stage_path}: {e}")
        return False';