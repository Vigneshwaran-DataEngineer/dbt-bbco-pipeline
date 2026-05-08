# dbt + BigQuery Data Pipeline

An end-to-end ELT pipeline built using dbt and BigQuery for data cleaning, transformation, testing, and analytics modeling.

> 📌 This is my first hands-on project using dbt, built to understand how modern analytics engineering workflows are designed in production environments.  
> The project helped me explore dbt model architecture, warehouse-native transformations, automated testing, and orchestration concepts using BigQuery.

---

## 📌 Project Overview

This project simulates a production-style analytics engineering workflow where raw order data is transformed into clean, validated, analytics-ready datasets using dbt.

The raw dataset intentionally contains:
- Duplicate records
- Inconsistent timestamp formats
- Null values
- Revenue mismatches
- Invalid quantities

The pipeline focuses on handling these issues systematically using modular dbt models and BigQuery transformations.

---

# 🛠 Tech Stack

- dbt Cloud
- Google BigQuery
- SQL

---

# 📂 Project Structure

```bash
models/
│
├── staging/
│   ├── stg_orders.sql
│   └── schema.yml
│
├── marts/
│   ├── revenue_by_channel.sql
│   ├── orders_by_status.sql
│   └── top_products.sql
