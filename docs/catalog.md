📊 Data Catalog — Gold Layer
Overview

The Gold Layer represents the business-level data model designed to support analytical and reporting use cases.
It consists of dimension tables and fact tables that store curated, business-ready data.

----
1. gold.dim_customers

Purpose
Stores customer information enriched with demographic and geographic attributes.

+------------------+--------------+---------------------------------------------------------------+
| Column Name      | Data Type    | Description                                                   |
+------------------+--------------+---------------------------------------------------------------+
| customer_key     | INT          | Surrogate key uniquely identifying each customer record.      |
| customer_id      | INT          | Unique numerical identifier assigned in the source system.    |
| customer_number  | NVARCHAR(50) | Business-friendly alphanumeric customer identifier.           |
| first_name       | NVARCHAR(50) | Customer’s first name.                                        |
| last_name        | NVARCHAR(50) | Customer’s last (family) name.                                |
| country          | NVARCHAR(50) | Country of residence (e.g., Australia).                        |
| marital_status   | NVARCHAR(50) | Marital status (e.g., Married, Single).                       |
| gender           | NVARCHAR(50) | Gender (e.g., Male, Female, n/a).                             |
| birthdate        | DATE         | Date of birth (YYYY-MM-DD).                                   |
| create_date      | DATE         | Date when the customer record was created.                    |
+------------------+--------------+---------------------------------------------------------------+

2. gold.dim_products

Purpose
Provides master product data and descriptive attributes for reporting and analysis.

+-----------------------+--------------+---------------------------------------------------------------+
| Column Name           | Data Type    | Description                                                   |
+-----------------------+--------------+---------------------------------------------------------------+
| product_key           | INT          | Surrogate key uniquely identifying each product record.       |
| product_id            | INT          | Unique product identifier in the source system.               |
| product_number        | NVARCHAR(50) | Alphanumeric product code for inventory and categorization.   |
| product_name          | NVARCHAR(50) | Descriptive product name.                                     |
| category_id           | NVARCHAR(50) | Identifier for the product category.                          |
| category              | NVARCHAR(50) | High-level classification (e.g., Bikes, Components).          |
| subcategory           | NVARCHAR(50) | Detailed classification within the category.                  |
| maintenance_required  | NVARCHAR(50) | Indicates whether maintenance is required (Yes/No).           |
| cost                  | INT          | Base cost of the product in whole currency units.             |
| product_line          | NVARCHAR(50) | Product line or series (e.g., Road, Mountain).                |
| start_date            | DATE         | Date when the product became available for sale.              |
+-----------------------+--------------+---------------------------------------------------------------+

3. gold.fact_sales

Purpose
Stores transactional sales data for revenue and performance analysis.
+------------------+--------------+---------------------------------------------------------------+
| Column Name      | Data Type    | Description                                                   |
+------------------+--------------+---------------------------------------------------------------+
| order_number     | NVARCHAR(50) | Unique sales order identifier (e.g., SO54496).                |
| product_key      | INT          | Foreign key referencing gold.dim_products.                    |
| customer_key     | INT          | Foreign key referencing gold.dim_customers.                   |
| order_date       | DATE         | Date when the order was placed.                               |
| shipping_date    | DATE         | Date when the order was shipped.                              |
| due_date         | DATE         | Payment due date.                                             |
| sales_amount     | INT          | Total sales value per line item.                              |
| quantity         | INT          | Number of units sold.                                         |
| price            | INT          | Price per unit in whole currency units.                       |
+------------------+--------------+---------------------------------------------------------------+


