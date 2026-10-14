# 🚀 Databricks_dbt-Lakehouse_Data_Engineering_Project
End-to-end Lakehouse project using Databricks, dbt, PySpark, Delta Lake &amp; Auto Loader. Features dynamic metadata-driven ingestion, automated pipelines, Bronze-Silver-Gold architecture, schema evolution, data quality, and dimensional modeling with dynamic fact &amp; dimension tables, dbt models, dbt macros, dbt seeds, dbt snapshots &amp; dbt tests.

<p align="center">
  <strong>End-to-End Data Transformation & Analytics using Databricks and dbt</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Azure%20Databricks-Lakehouse-red?style=for-the-badge&logo=databricks" alt="Azure Databricks"/>
  <img src="https://img.shields.io/badge/dbt-Transformation-orange?style=for-the-badge&logo=dbt" alt="dbt"/>
  <img src="https://img.shields.io/badge/SQL-Data%20Engineering-blue?style=for-the-badge&logo=postgresql" alt="SQL"/>
  <img src="https://img.shields.io/badge/Delta%20Lake-Storage-purple?style=for-the-badge" alt="Delta Lake"/>
</p>

---

## 📌 Project Overview

This project demonstrates an end-to-end data engineering workflow built using **Azure Databricks and dbt**, following the Medallion Architecture.

Raw business datasets are transformed into clean, standardized, and analytics-ready data through modular SQL models, dimensional modeling, and data quality testing.

The Gold layer provides customer-level insights, product profitability metrics, transactional sales data, and reporting models for business analysis.

## 🏗️ Architecture

```text
          Source Datasets
 Customers | Orders | Products
 Order Items | Payments
                │
                ▼
         🥉 BRONZE LAYER
           Raw Data
                │
                ▼
         🥈 SILVER LAYER
  Cleaning • Standardization
       Deduplication
                │
                ▼
          🥇 GOLD LAYER
                │
       ┌────────┼─────────┐
       ▼        ▼         ▼
  dim_customers dim_products fact_sales
       │        │         │
       └────────┼─────────┘
                ▼
        Reporting Models
    customer_sales_report
     product_sales_report
                │
                ▼
        Business Analytics
```

## 🛠️ Technology Stack

| Technology | Application in Project |
|---|---|
| **Azure Databricks** | Lakehouse data processing and transformation |
| **dbt Core** | SQL-based modeling, dependencies, and testing |
| **Databricks SQL** | Data transformation and analytical logic |
| **Delta Lake** | Lakehouse data storage |
| **Unity Catalog** | Data organization and governance |
| **YAML** | Model metadata, descriptions, and test definitions |
| **Git & GitHub** | Version control and project management |

## 🥉 Medallion Architecture

### Bronze Layer — Raw Data

- Organizes source datasets for downstream processing.
- Establishes source definitions for the transformation pipeline.

### Silver Layer — Cleaned Data

- Standardizes customer, order, product, payment, and order-item datasets.
- Handles duplicate records and data type conversions where required.
- Applies transformation logic to prepare reliable datasets for analytics.

### Gold Layer — Business-Ready Data

| Model | Business Purpose |
|---|---|
| `dim_customers` | Customer profiles and aggregated order and sales metrics |
| `dim_products` | Product attributes, unit profitability, and profit margins |
| `fact_sales` | Transaction-level sales, discounts, costs, and profit |
| `customer_sales_report` | Customer purchase behavior and sales performance |
| `product_sales_report` | Product sales performance and profitability analysis |

## 🧪 Data Quality & Validation

Data quality is an integral part of the transformation pipeline.

- **Uniqueness and completeness:** Validates key identifiers and mandatory fields.
- **Referential integrity:** Checks relationships between related datasets.
- **Business-rule validation:** Applies accepted-value and numeric validation rules where configured.
- **Custom dbt tests:** Implements reusable SQL-based data quality checks.

### Latest Build Results

| Metric | Result |
|---|---:|
| Models | 15 |
| Data Tests | 65 |
| Analyses | 5 |
| Sources | 5 |
| Successful Resources | 80 |
| Warnings | 0 |
| Errors | 0 |

*Results from the latest successful `dbt build` run.*

## 📚 Data Lineage & Documentation

**dbt Docs** provides a visual representation of model dependencies and lineage, along with metadata for exploring the transformation pipeline.

This makes it easier to understand how source datasets flow through Bronze, Silver, and Gold layers and contribute to downstream reporting models.

## 💡 Key Project Outcomes

- Implemented a layered Lakehouse transformation architecture.
- Developed modular SQL models using dbt.
- Designed fact and dimension models for analytical use cases.
- Created customer and product reporting datasets.
- Implemented built-in and custom data quality tests.
- Used dbt Docs to explore model dependencies and lineage.

---

<p align="center">
  <strong>Built with Azure Databricks · dbt · SQL</strong>
</p>
