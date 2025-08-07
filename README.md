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

## Questions List - 

# 🏙️ Generic
How many unique cities does the data have?

In which city is each branch?

# 🛍️ Product
How many unique product lines does the data have?

What is the most common payment method?

What is the most selling product line?

What is the total revenue by month?

What month had the largest COGS?

What product line had the largest revenue?

What is the city with the largest revenue?

What product line had the largest VAT?

Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales. (Note: Not implemented in SQL)

Which branch sold more products than average product sold?

What is the most common product line by gender?

What is the average rating of each product line?

# 💰 Sales
Number of sales made in each time of the day per weekday

Which of the customer types brings the most revenue?

Which city has the largest tax percent/VAT (Value Added Tax)?

Which customer type pays the most in VAT?

# 👥 Customer
How many unique customer types does the data have?

How many unique payment methods does the data have?

What is the most common customer type?

Which customer type buys the most?

What is the gender of most of the customers?

What is the gender distribution per branch?

Which time of the day do customers give most ratings?

Which time of the day do customers give most ratings per branch?

Which day of the week has the best average ratings?

Which day of the week has the best average ratings per branch?



## 📌 Conclusion
This project provides valuable insights into Walmart's sales performance, customer preferences, and product demand. The SQL queries and data analysis techniques used in this project can help businesses optimize their sales strategies and improve overall profitability.

