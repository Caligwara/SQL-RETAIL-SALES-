
SELECT * FROM[dbo].[SALES RETAIL DATA]

SELECT COUNT (*) FROM[dbo].[SALES RETAIL DATA]

---- Data Cleaning

SELECT * FROM[dbo].[SALES RETAIL DATA]
where Transactions_id is null
or
 Sale_date is null
or
 Sale_time is null
or
 Customer_id is null
or
 Gender is null
or
 Category is null
or
 Quantiy is null
or
 price_per_unit is null
or
 Cogs is null
or
 Total_sale is null
 --delete
 
 delete from [SALES RETAIL DATA]
 where Transactions_id is null
or
 Sale_date is null
or
 Sale_time is null
or
 Customer_id is null
or
 Gender is null
or
 Category is null
or
 Quantiy is null
or
 price_per_unit is null
or
 Cogs is null
or
 Total_sale is null
 
 --Data Exploration

 --- How many sales we have

 
 SELECT COUNT (*) as Total_sales FROM[dbo].[SALES RETAIL DATA]
 -- How Many Customers we have

  SELECT COUNT (Customer_id) as Total_customers FROM[dbo].[SALES RETAIL DATA]
 
 SELECT COUNT (distinct Customer_id) as Total_Uniquecustomers FROM[dbo].[SALES RETAIL DATA]

 --Distinct Category

 SELECT distinct (Category) as Distinct_category FROM[dbo].[SALES RETAIL DATA]

  SELECT count (distinct Category) as Distinct_category FROM[dbo].[SALES RETAIL DATA]

  ---- DATA ANALYSIS
  --Q1. Write a SQL query to retrieve all the sales made on 2022-11-05

  Select * from [SALES RETAIL DATA] 
  where Sale_date = '2022-11-05'

  --Q2. Write a SQL query to retrieve all transactions where the category is clothing and 
  -- the quantity sold is more than or equalto 4 in the month of Nov-2022

  Select * from [SALES RETAIL DATA]
  where 
  Category = 'Clothing'
  and
month(Sale_date)='11'
  and
  year(Sale_date)='2022'
  and
  Quantiy >= '4'

  ----- style

   Select * from [SALES RETAIL DATA]
  where 
  Category = 'Clothing'
  and
Sale_date like '2022-11-%'
  and
  Quantiy >= '4'

  --Q3. Write a SQL query to calculate the total sales for each category

  select 
  Category,
  sum(Total_sale) as net_sales,
  COUNT (*) as Total_orders
  from [SALES RETAIL DATA]
  GROUP BY Category

  --Q4. Write a SQL query to find the average age of customers who purchase items from the beauty category
 
 select 
 avg (age) as AVG_age
  from [SALES RETAIL DATA]
  where Category = 'Beauty'

  --Q5. Write a SQL query to Find all transaction where total_sale is greater than 1000

  select * from [SALES RETAIL DATA]
  set rowcount 0
  where Total_sale > '1000'

  --Q6. Write a SQL query to Find the total number of transactions made by each gender in each category
   
   select
   Category,
   Gender,
   count(*) as gender_sales
  
   from [SALES RETAIL DATA]
   group by
   Category,
    gender
	order by 1

	--Q7. write a SQL query to calculate the average sales for each month, find out best selling month in each year
select * FROM
	(select 
	 year(sale_date) as year,
	month(sale_date) as month,
	avg(total_sale)as avg_sale,
	rank() over( partition by year(sale_date) order by avg (total_sale) desc) as Rank
	from [SALES RETAIL DATA]
	group by Sale_date) AS T1
where rank = '1'
	order by 1,3 desc
	
	--Q8. Write a SQL query to find the top 5 customers based on the highest total sale
	
	select top 5
	Customer_id,
	sum(total_sale)as totalsale
	from [SALES RETAIL DATA]
	group by Customer_id
	order by 2 desc
	
-- Q9. Write a SQL query of unigue customers who purchased items from each category

select 
category,
count( distinct customer_id) as distinct_customers
from [SALES RETAIL DATA]
group by Category


-- Q10. Write a SQL query of create shift and number of orders ( example Morning <=12,Afternoon between 12 & 17, Evening>17)

select *,
case
when datepart (hour,sale_time) <'12' then 'Morning'
when datepart (hour,sale_time) between '12' and '17' then'Afternoon'
else 'Evening'
end as shift
from [SALES RETAIL DATA]

select *
from [SALES RETAIL DATA]
where Customer_id ='97'
and category = 'beauty'