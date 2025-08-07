create or replace storage integration s3_data_integration
    type = external_stage
    storage_provider = 's3'
    storage_aws_role_arn = 'INSERT-ARN'
    enabled = true
    storage_allowed_locations = ( 's3 url' );

-- Retrieve the ARN and external ID for IAM user
DESC INTEGRATION s3_data_integration;

-- Assign 'CREATE STAGE' and 'USAGE' privileges on storage integration to role(s)
GRANT CREATE STAGE ON SCHEMA sales TO ROLE ACCOUNTADMIN;
GRANT USAGE ON INTEGRATION s3_data_integration TO ROLE ACCOUNTADMIN;