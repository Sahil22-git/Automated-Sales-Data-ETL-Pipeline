# Automated Sales Data ETL & Analytics Pipeline
**Python · MySQL · Power BI**

An end to end production style ETL pipeline that ingests messy multi-batch sales data, validates and transforms it, loads it into a relational database, generates automated SQL analytics reports and visualises insights through an interactive Power BI dashboard all triggered by a single command.

---

## What This Project Demonstrates

- Real-world data validation: identified and removed **3,227 records (37% of raw dataset)** with null product identifiers
- End to end pipeline automation from raw CSV ingestion to SQL reporting
- Advanced SQL: window functions, CTEs, ranking queries, aggregations
- Interactive Power BI dashboard built directly on pipeline output
- Modular, production ready Python codebase

---

## Architecture

```
Raw CSV Files (Multi Batch, Messy Data)
        ↓
Ingestion Layer - Python (Pandas)
        ↓
Data Cleaning & Validation
  - Removed 3,227 null product records
  - Deduplicated 9,000+ raw records → 8,500+ clean records
  - Standardised date formats, numeric types, negative values
        ↓
Business Transformation
  - Derived: Order Year, Order Month, Shipping Days
        ↓
MySQL Database (sales_data_clean)
        ↓
Automated SQL Analytics Reports (10+ report types)
        ↓
Power BI Dashboard (2 page interactive, $1.97M revenue tracked)
```

---

## Tech Stack

| Layer | Tools |
|---|---|
| Data Processing | Python (Pandas, SQLAlchemy, PyMySQL) |
| Database | MySQL |
| Analytics | SQL (Window Functions, CTEs, Aggregations) |
| Visualisation | Power BI (DAX, Top N Filters, Synced Slicers) |

---

## Pipeline Stages

### 1. Data Ingestion
- Dynamically reads multiple CSV batch files
- Adds `source_file` tracking column per batch
- Merges all files into a unified dataset (9,000+ records)

### 2. Data Cleaning & Validation
- Removed **3,227 records** with null or placeholder product identifiers
- Deduplicated records → **8,559 clean records retained**
- Handled missing values, negative sales and invalid numeric entries
- Standardised date formats across all batches
- Logged all cleaning activity for auditability

### 3. Business Transformation
Engineered analytical features:
- `Order Year` — for year over year trend analysis
- `Order Month` — for seasonality and monthly revenue tracking
- `Shipping Days` — delivery performance metric (avg: 113 days flagged as operational risk)

### 4. Database Loading
- Connected to MySQL via SQLAlchemy
- Loaded clean dataset into `sales_data_clean` table
- Auto replaces stale data on each pipeline run

### 5. Automated SQL Reporting (10+ Reports)
All reports auto exported as CSV files:

| Report | SQL Technique |
|---|---|
| Monthly sales trend | GROUP BY + ORDER BY |
| Top 5 customers by revenue | Aggregation + LIMIT |
| Regional sales performance | GROUP BY Region |
| Top 10 products by revenue | Aggregation + LIMIT |
| Yearly sales growth | GROUP BY Year |
| Avg shipping time by region | AVG + GROUP BY |
| Sales by customer segment | Segmentation query |
| Top 5 cities by revenue | Geographic aggregation |
| Long shipping delay detection | WHERE filter + anomaly flag |
| Category performance ranking | RANK() window function |
| Running total sales | SUM() OVER window function |
| Best customer per region | RANK() PARTITION BY Region |

### 6. Power BI Dashboard
Built directly on `sales_data_clean` MySQL output:

**Page 1 — Sales Overview**
- KPI cards: Total Revenue ($1.97M), Total Orders (8,559), Late Shipment % (95%), Avg Shipping Days (113)
- Monthly revenue trend (line chart)
- Revenue by Region (bar chart)
- Revenue by Segment — Consumer 47%, Corporate 32%, Home Office 21% (donut chart)
- Dynamic slicers: Year, Region, Segment

**Page 2 — Product & Customer Analysis**
- Top 10 Products by Revenue
- Top 5 Cities by Revenue
- Best Customer per Region
- Category Performance — Technology leads at $503K (40.7%)
- Synced slicers across both pages

---

## Key Business Insights

- **West region** is the highest revenue contributor
- **Technology** is the top performing category at $503K (40.7% of total revenue)
- **95% of orders** exceed 7 day shipping threshold - significant operational risk
- **Average shipping time of 113 days** indicates fulfilment bottleneck worth investigating
- **Consumer segment** drives 47% of total revenue
- **New York City** is the top city by revenue

---

## How to Run

```bash
# 1. Clone the repository
git clone https://github.com/Sahil22-git/Automated-Sales-Data-ETL-Pipeline

# 2. Install dependencies
pip install -r requirements.txt

# 3. Update MySQL credentials in:
#    scripts/load.py
#    reports/generate_report.py

# 4. Run the full pipeline
python main.py
```

All reports will be generated inside the `reports/` folder.

---

## Project Structure

```
Automated-Sales-Data-ETL-Pipeline/
│
├── scripts/
│   ├── ingest.py         # Batch CSV ingestion
│   ├── clean.py          # Validation & cleaning
│   ├── transform.py      # Feature engineering
│   └── load.py           # MySQL loading
│
├── reports/
│   └── generate_report.py  # Automated SQL reports
│
├── dashboard/
│   └── sales_dashboard.pbix  # Power BI dashboard file
│
├── main.py               # Single-command pipeline entry point
├── requirements.txt
└── README.md
```

---

## Future Improvements

- Add pipeline scheduling (Apache Airflow / Cron)
- Add automated testing framework (pytest)
- Add data quality monitoring and alerting
- Cloud deployment (AWS RDS + S3 + Lambda)
- Real-time streaming ingestion (Kafka / Spark)

---

## About

Built by **Sahil Patil** — Data Analyst with experience in SQL, Python, Power BI, and ETL pipeline development.
