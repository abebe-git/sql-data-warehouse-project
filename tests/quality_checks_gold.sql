-- *******************************************************************************
-- Checking gold.producr_key
-- *******************************************************************************
Script Purpose
    This script performs quality checks to validate the integrity, consistency and accuracy of the Gold Lyer. This checks answer:
    - Uniqueness of surrogate keys in dimension Tables
    - Referencial integrity between fact and dimension Tables
    - Validation of relasionship in the data model for analytical purpose
Usage Rules
  - Run this checks after data loading silver layer
  - Investigate and resolve any duplications found during the checks
-- *******************************************************************************
  */
  
-- *******************************************************************************
-- Checking gold.customer_key
-- *******************************************************************************
-- Checking for the uniqueness of product key for gold.customer_key
-- Expectation: No Results
SELECT
  customer_key,
  COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- *******************************************************************************
-- Checking gold.producr_key
-- *******************************************************************************
-- Checking for the uniqueness of product key for gold.products_key
-- Expectation: No Results
SELECT
  product_key,
  COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- *******************************************************************************
-- Checking gold.producr_key
-- *******************************************************************************
-- Checking for the connectivity between facts and dimensions
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers C
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products P
ON P.product_key = f.product_key
WHERE c.customer_key IS NULL OR P.product_key IS NULL

