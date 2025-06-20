/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `COPY` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
     CALL load_bronze_data();
===============================================================================
*/

-- Stored procedure to load all CSV files into bronze tables
CREATE OR REPLACE PROCEDURE load_bronze_data()
LANGUAGE plpgsql
AS $BODY$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    duration INTERVAL;
BEGIN
    -- Load CRM data
    start_time := clock_timestamp();
    TRUNCATE TABLE bronze.crm_cust_info;
    COPY bronze.crm_cust_info
    FROM 'E:\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
    end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE 'Loaded crm_cust_info table in % ms', EXTRACT(MILLISECONDS FROM duration);

    start_time := clock_timestamp();
    TRUNCATE TABLE bronze.crm_prd_info;
    COPY bronze.crm_prd_info
    FROM 'E:\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
    end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE 'Loaded crm_prd_info table in % ms', EXTRACT(MILLISECONDS FROM duration);

    start_time := clock_timestamp();
    TRUNCATE TABLE bronze.crm_sales_details;
    COPY bronze.crm_sales_details
    FROM 'E:\sql-ultimate-course\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
    end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE 'Loaded crm_sales_details table in % ms', EXTRACT(MILLISECONDS FROM duration);

    -- Load ERP data
    start_time := clock_timestamp();
    TRUNCATE TABLE bronze.erp_cust_az12;
    COPY bronze.erp_cust_az12
    FROM 'E:\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
    end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE 'Loaded erp_cust_az12 table in % ms', EXTRACT(MILLISECONDS FROM duration);

    start_time := clock_timestamp();
    TRUNCATE TABLE bronze.erp_loc_a101;
    COPY bronze.erp_loc_a101
    FROM 'E:\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
    end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE 'Loaded erp_loc_a101 table in % ms', EXTRACT(MILLISECONDS FROM duration);

    start_time := clock_timestamp();
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    COPY bronze.erp_px_cat_g1v2
    FROM 'E:\sql-ultimate-course\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
    end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE 'Loaded erp_px_cat_g1v2 table in % ms', EXTRACT(MILLISECONDS FROM duration);

    -- Log completion
    RAISE NOTICE 'All bronze tables loaded successfully at %', CURRENT_TIMESTAMP;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error loading bronze data: %', SQLERRM;
END;
$BODY$;
