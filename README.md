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
--Q1. write a sql query to retrive all columns from sales made on '2022-11-05'

select * from newtable_1 
where 
sale_date = '2022-11-05';

--Q2. write sql query to retrive all transactions where the category is clothing and the quantity sold is more than 4 in the month of nov-2022
 select transactions_id  from newtable_1 
 where category = 'Clothing' and quantiy >=4 and sale_date between '2022-11-01' and '2022-11-30';

--Q3. write an sql query  to calculate total sales (total_sale) for each category

select *,sum(s.total_sale)  
over (partition by s.category) as total_sales
from newtable_1 as s;

--Q4.write a  sql query to find the average age of customers who purchased items from the 'Beauty' category
 select round(avg(age),2) 
from newtable_1 
where category = 'Beauty';

--Q5. write a sql query  to find all transactions where the total _sale is greater than 1000;
select *
from newtable_1 
where total_sale >1000;

--Q6. write a sql query to find total number of  transactions (transactions_id) made by each gender in each category
select count(*),category,gender
from newtable_1
group by gender ,category;
  --Q7. write a sql query to calculate the average sale for each month . Find out  best selling month for each year
  
  select * from
  (
  select 
  year(sale_date) as Year,
  month(sale_date) as Month,
  avg(total_sale) as avg_sale,
  rank() over (partition by year(sale_date) order by avg(total_sale) desc) as sales_rank
from newtable_1
group by Year,month) as t1
where sales_rank = 1;  
   
--Q8. write an sql query to find the top 5 customers based on the highest total sales
 select
 customer_id,
 sum(total_sale) as total_sales,
 dense_rank() over(order by sum(total_sale)  desc) as customer_rank
 from newtable_1
 group by customer_id
 order by total_sales desc
limit 5;

--Q9. write a sql query to find the number of unique customers who purchased items from each category.
select 
category,
count(distinct customer_id )
from newtable_1 
group by category;

Q10.  write  a sql query to create each shift  and number of orders (Example Morning  < = 12 ,Afternoon between 12 & 17, Evening >17) 

with hourly_sales as (
select * ,
  case 
  	when hour(sale_time) < 12 then 'Morning'
  	when hour(sale_time) between 12 and 17 then 'Afternoon'
  	else  'Evening'
  	end as shift 
    from newtable_1
)
select shift,count(*) from hourly_sales
group by shift ;
--end of project
