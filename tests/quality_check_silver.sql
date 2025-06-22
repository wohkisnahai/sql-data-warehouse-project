-- =============================================================================
-- Quality Checks on Silver Layer
-- =============================================================================

-- ============================================================================
-- silver.crm_cust_info
-- ============================================================================

-- Check for NULLs or Duplicates in Primary Key (Expected: No results)
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for unwanted spaces in cst_key
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Marital status standardization check
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- ============================================================================
-- silver.crm_prd_info
-- ============================================================================

-- Check for NULLs or Duplicates in Primary Key
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted spaces in product names
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULLs or negative product cost
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Product line standardization
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Invalid date order: end date before start date
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ============================================================================
-- silver.crm_sales_details
-- ============================================================================

-- Invalid due dates in raw source (bronze)
SELECT 
    sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
   OR LENGTH(sls_due_dt::TEXT) != 8 
   OR sls_due_dt > 20500101 
   OR sls_due_dt < 19000101;

-- Invalid order > ship or due
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Data consistency: Sales = Quantity × Price
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- ============================================================================
-- silver.erp_cust_az12
-- ============================================================================

-- Out-of-range birthdates
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < DATE '1924-01-01' 
   OR bdate > CURRENT_DATE;

-- Gender standardization
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- ============================================================================
-- silver.erp_loc_a101
-- ============================================================================

-- Country code standardization
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ============================================================================
-- silver.erp_px_cat_g1v2
-- ============================================================================

-- Check for unwanted spaces in cat/subcat/maintenance
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Maintenance field standardization
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
