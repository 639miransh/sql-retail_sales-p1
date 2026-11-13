# Retail Sales Analysis SQL Project

## Project Overview
**Project Title**: Retail Sales Analysis  
**Database**: `retail_sales_db`  
**Tools Used**: SQL (PostgreSQL / MySQL)

This project demonstrates end-to-end data exploration, cleaning, and business analysis on a retail sales dataset (`SQL - Retail Sales Analysis_utf .csv`).

---

## Objectives
1. **Database Setup**: Create and populate a retail sales database from the raw CSV file.
2. **Data Cleaning**: Identify and remove records with missing or `NULL` values.
3. **Exploratory Data Analysis (EDA)**: Understand overall sales volume, customer demographics, and product categories.
4. **Business Analysis**: Answer specific business questions using SQL queries to uncover actionable sales insights.

---

## Key SQL Queries & Analysis

### 1. Data Cleaning
```sql
-- Check for NULL values
SELECT * FROM retail_sales
WHERE transactions_id IS NULL 
   OR sale_date IS NULL 
   OR total_sale IS NULL;
```

### 2. Business Questions Answered
* **What are the top-performing product categories by total revenue?**
* **Which shift (Morning, Afternoon, Evening) generates the highest number of orders?**
* **Who are the top 5 customers based on total spend?**
* **What is the average age of customers purchasing items from each category?**

---

## Key Findings
* **Customer Demographics**: Customers across various age groups purchased items, with strong demand across core retail categories.
* **Peak Sales Hours**: Transaction volume peaked during specific daily shifts, helping inform staffing and inventory decisions.
* **High-Value Sales**: Multiple high-value orders contributed significantly to overall revenue.

---

## Files in This Repository
* `Project 1.sql`: Contains all SQL scripts for table creation, data cleaning, and business analysis.
* `SQL - Retail Sales Analysis_utf .csv`: Raw dataset used for the analysis.
* `README.md`: Project documentation and summary of findings.
*
