# 📒 Gold Layer Data Catalog

## Overview  
The **Gold Layer** represents the finalized, business-ready dataset tailored for analytics and reporting. It includes **dimension tables** for descriptive context and **fact tables** for quantitative metrics, following a star schema design.

---

## 1. `gold.dim_customers`

**Description:**  
Contains enriched customer details, combining personal, demographic, and geographic data.

**Fields:**

| Column Name     | Data Type    | Description                                                                 |
|-----------------|--------------|-----------------------------------------------------------------------------|
| `customer_key`  | INT          | Surrogate key uniquely identifying each customer in the dimension.         |
| `customer_id`   | INT          | System-assigned numeric ID for each customer.                              |
| `customer_number` | NVARCHAR(50) | External or business-facing customer identifier.                          |
| `first_name`    | NVARCHAR(50) | Customer’s first name.                                                     |
| `last_name`     | NVARCHAR(50) | Customer’s surname or family name.                                         |
| `country`       | NVARCHAR(50) | Country of residence (e.g., 'Germany').                                    |
| `marital_status`| NVARCHAR(50) | Marital status (e.g., 'Single', 'Married').                                |
| `gender`        | NVARCHAR(50) | Gender as 'Male', 'Female', or 'n/a'.                                      |
| `birthdate`     | DATE         | Date of birth in `YYYY-MM-DD` format.                                      |
| `create_date`   | DATE         | Timestamp of when the customer record was first created.                   |

---

## 2. `gold.dim_products`

**Description:**  
Describes products along with classification and attributes for analysis.

**Fields:**

| Column Name           | Data Type    | Description                                                                 |
|-----------------------|--------------|-----------------------------------------------------------------------------|
| `product_key`         | INT          | Surrogate key uniquely identifying each product record.                     |
| `product_id`          | INT          | Internal system ID for each product.                                        |
| `product_number`      | NVARCHAR(50) | Alphanumeric product code used for tracking and categorization.             |
| `product_name`        | NVARCHAR(50) | Descriptive name of the product.                                            |
| `category_id`         | NVARCHAR(50) | Unique ID linking the product to its category.                              |
| `category`            | NVARCHAR(50) | Broad classification of the product (e.g., 'Bikes').                        |
| `subcategory`         | NVARCHAR(50) | Specific classification within the category.                                |
| `maintenance_required`| NVARCHAR(50) | Indicates if the product needs maintenance ('Yes' or 'No').                 |
| `cost`                | INT          | Base cost of the product.                                                   |
| `product_line`        | NVARCHAR(50) | Product series or segment (e.g., 'Mountain').                               |
| `start_date`          | DATE         | Date the product became available.                                          |

---

## 3. `gold.fact_sales`

**Description:**  
Captures transactional sales activity for business reporting and analysis.

**Fields:**

| Column Name     | Data Type    | Description                                                                 |
|-----------------|--------------|-----------------------------------------------------------------------------|
| `order_number`  | NVARCHAR(50) | Unique identifier for each sales transaction (e.g., 'SO54496').            |
| `product_key`   | INT          | Foreign key linking to `dim_products`.                                     |
| `customer_key`  | INT          | Foreign key linking to `dim_customers`.                                    |
| `order_date`    | DATE         | The date the order was placed.                                             |
| `shipping_date` | DATE         | The date the order was shipped.                                            |
| `due_date`      | DATE         | The due date for payment collection.                                       |
| `sales_amount`  | INT          | Total amount for the sale (e.g., price × quantity).                        |
| `quantity`      | INT          | Number of units sold in the transaction.                                   |
| `price`         | INT          | Unit price of the product at the time of sale.                             |
