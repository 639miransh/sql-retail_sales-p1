use kaggle_project;
 select * from newtable_1;
drop  kaggle_project;

-- Data Cleaning
select * from newtable_1 where transactions_id  is null;
select * from newtable_1 where sale_time  is null;

select * from newtable_1  where transactions_id  is null
                                or sale_date is null 
                                or sale_time is null 
                                or customer_id is null
                                or gender is null 
                                or age is null 
                                or category is null 
                                or quantiy is null 
                                or price_per_unit is null 
                                or cogs is null 
                                or total_sale is null;
delete from newtable_1 where transactions_id  is null

                                or sale_date is null 
                                or sale_time is null 
                                or customer_id is null
                                or gender is null 
                                or age is null 
                                or category is null 
                                or quantiy is null 
                                or price_per_unit is null 
                                or cogs is null 
                                or total_sale is null;
  
                                
                                
--data Exploration
--How many sales or records we have 
select count(*) as total_sale from newtable_1 ;

--How many unique customers we have
select count(distinct customer_id) as customer_demand from newtable_1;

--How many categories
select count(distinct category) as category_types from newtable_1;

--Data Analysis or Business Problems

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