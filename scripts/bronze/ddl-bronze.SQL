/*
**************************************************************************************************************
DDL Script: Create Bronze Tables
**************************************************************************************************************
Script Purpose:
	This script creates tables in the 'bronze' schema, dropping existing tables if they already exists.
	Run this script to re-define the DDL structure of 'bronze' Tables
	**********************************************************************************************************
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info

GO

CREATE TABLE bronze.crm_cust_info (
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar (50),
	cst_material_status nvarchar (50),
	cst_gndr nvarchar(50),
	cst_create_date date 
) 
GO

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info

GO
CREATE TABLE bronze.crm_prd_info (
	prd_id int,
	prd_key nvarchar (50),
	prd_nm nvarchar (50),
	prd_cost int NULL,
	prd_line nvarchar(50),
	prd_start_dt date,
	prd_end_date date
) 
GO

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details
GO

CREATE TABLE bronze.crm_sales_details (
	sls_ord_num nvarchar (50),
	sls_prd_key nvarchar (50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int
) 

GO
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12
GO
CREATE TABLE bronze.erp_cust_az12 (
	cid nvarchar (50),
	bdate date NULL,
	gen nvarchar (50)
) 

GO

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101
GO

CREATE TABLE bronze.erp_loc_a101 (
	cid nvarchar (50),
	cntry nvarchar (50)
) 
GO

IF OBJECT_ID('bronze.erp_PX_CAT_G1V2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_PX_CAT_G1V2
GO

CREATE TABLE bronze.erp_PX_CAT_G1V2(
	id nvarchar (50),
	cat nvarchar (50),
	subcat nvarchar(50),
	maintenance nvarchar (50)
) 
GO
