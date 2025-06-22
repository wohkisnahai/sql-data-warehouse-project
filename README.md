# 📊 Data Warehouse Project

## 📖 Project Overview

This project involves building a modern data warehouse using the **Medallion Architecture** — consisting of Bronze, Silver, and Gold layers — to support end-to-end data analytics. Key components include:

- **Data Architecture**: Designing a robust data flow using layered data processing.
- **ETL Pipelines**: Extracting, transforming, and loading data from raw ERP and CRM sources.
- **Data Modeling**: Creating fact and dimension tables optimized for analytical queries.
- **Analytics & Reporting**: Generating SQL-based reports and dashboards for insights.

---

## 🎯 Objective

Develop a scalable, maintainable data warehouse on **SQL Server** to consolidate sales and customer data for analytical reporting and data-driven decision-making.

---

## 🛠 Specifications

- **Data Sources**: Two source systems — ERP and CRM — provided as CSV files.
- **Data Quality**: Data cleansing, standardization, and deduplication applied.
- **Integration**: Merge datasets into a single star schema optimized for querying.
- **Scope**: Focus on current/latest snapshot data only (no historization).
- **Documentation**: All structures and transformations are well documented for both business and technical stakeholders.

---

## 📂 Repository Structure

```plaintext
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── naming-conventions.md          # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
└── README.md                           # Project overview and instructions

