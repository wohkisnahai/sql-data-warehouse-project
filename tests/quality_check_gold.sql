-- ================================================================================
-- Quality Checks: Gold Layer
-- ================================================================================
-- Purpose:
--   - Validate surrogate key uniqueness in dimensions.
--   - Verify foreign key relationships between fact and dimension tables.
--   - Ensure data model integrity for analytics.
-- ================================================================================

-- ============================================================================
-- Check Uniqueness of customer_key in gold.dim_customers
-- Expectation: No duplicate keys should be returned
-- ============================================================================
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ============================================================================
-- Check Uniqueness of product_key in gold.dim_products
-- Expectation: No duplicate keys should be returned
-- ============================================================================
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ============================================================================
-- Check referential integrity in gold.fact_sales
-- Ensures every fact record links to a valid customer and product
-- ============================================================================
SELECT 
    f.* 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p ON p.product_key = f.product_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL;
