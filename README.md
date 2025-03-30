# Walmart Sales Data Analysis

## 📌 Project Overview
This project aims to analyze Walmart sales data to understand top-performing branches, product trends, customer behavior, and sales strategies. The dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).

## 🎯 Objectives
- Identify high-performing branches and products.
- Analyze sales trends across different product lines.
- Understand customer behavior and preferences.
- Optimize sales strategies using data-driven insights.

## 🗂️ Dataset Description
The dataset consists of **17 columns** and includes sales transactions from **three Walmart branches**.

| Column                  | Description                              | Data Type      |
|-------------------------|------------------------------------------|---------------|
| `invoice_id`           | Unique identifier for sales transactions | VARCHAR(30)   |
| `branch`               | Store branch code                        | VARCHAR(5)    |
| `city`                 | Store location                           | VARCHAR(30)   |
| `customer_type`        | Type of customer                        | VARCHAR(30)   |
| `gender`               | Customer gender                         | VARCHAR(10)   |
| `product_line`         | Category of product sold                | VARCHAR(100)  |
| `unit_price`           | Price per unit                          | DECIMAL(10,2) |
| `quantity`             | Number of units sold                    | INT           |
| `VAT`                  | Tax applied on the purchase             | FLOAT(6,4)    |
| `total`                | Total transaction amount                 | DECIMAL(10,2) |
| `date`                 | Date of purchase                        | DATE          |
| `time`                 | Time of purchase                        | TIME          |
| `payment_method`       | Payment method used                     | VARCHAR(20)   |
| `cogs`                 | Cost of goods sold                      | DECIMAL(10,2) |
| `gross_margin_pct`     | Profit margin percentage                 | FLOAT(11,9)   |
| `gross_income`         | Total profit earned                     | DECIMAL(10,2) |
| `rating`               | Customer rating                         | FLOAT(2,1)    |

## 🔍 Analysis Performed

### 🏪 Branch & Sales Analysis
- Identify **top-performing branches** based on total sales and profit.
- Find the **city with the highest revenue**.
- Analyze **sales trends across different months**.

### 📊 Product Analysis
- Identify the **best-selling product line**.
- Determine the **most profitable product category**.
- Compare **product sales based on customer gender**.

### 👥 Customer Analysis
- Identify the **most common customer type**.
- Analyze **which customer type generates the most revenue**.
- Determine **the preferred payment method**.
- Find out **which day of the week has the most purchases**.

## 🛠️ SQL Approach & Implementation
### 1️⃣ **Data Cleaning & Preprocessing**
- Remove null values and duplicates.
- Format date and time for better analysis.
- Create additional time-based columns (`time_of_day`, `day_name`, `month_name`).

### 2️⃣ **Exploratory Data Analysis (EDA)**
- Use **GROUP BY** to analyze sales trends per branch and product line.
- Use **JOINS** for deeper insights into customer behavior.
- Apply **aggregate functions** (`SUM`, `AVG`, `COUNT`) to summarize key metrics.

## 📈 Revenue & Profit Calculation
- **Cost of Goods Sold (COGS):** `COGS = unit_price * quantity`
- **VAT Calculation:** `VAT = 5% * COGS`
- **Total Sales Amount:** `total = COGS + VAT`
- **Gross Income:** `gross_income = total - COGS`
- **Gross Margin %:** `gross_margin_pct = (gross_income / total) * 100`

## 📌 Conclusion
This project provides valuable insights into Walmart's sales performance, customer preferences, and product demand. The SQL queries and data analysis techniques used in this project can help businesses optimize their sales strategies and improve overall profitability.

