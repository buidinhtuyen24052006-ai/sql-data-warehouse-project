# /*

# BRONZE LAYER TABLE CREATION SCRIPT

Description:
This script initializes the Bronze layer of the data warehouse.
It creates raw, unprocessed tables to store data ingested from
CRM and ERP source systems. The Bronze layer preserves data in
its original structure for traceability and auditing.

Tables Included:

1. bronze.crm_cust_info

   * Stores customer master data from CRM system.

2. bronze.crm_prd_info

   * Stores product information including cost, product line,
     and lifecycle dates.

3. bronze.crm_sales_details

   * Stores transactional sales data such as orders, shipping,
     pricing, and quantities.

4. bronze.erp_cust_az12

   * Stores additional customer attributes from ERP system
     (e.g., birthdate, gender).

5. bronze.erp_loc_a101

   * Stores customer location information (country).

6. bronze.erp_px_cat_g1v2

   * Stores product category hierarchy and maintenance data.

Notes:

* All tables are dropped and recreated to ensure a clean load.
* Data types are kept close to source format (minimal transformation).
* This layer is intended for staging only; no business logic applied.

Author: [Your Name]
Created Date: [YYYY-MM-DD]
==========================

*/



DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE
);

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);
