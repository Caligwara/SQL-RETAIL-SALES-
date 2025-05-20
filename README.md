# SQL-RETAIL-SALES
MY SQL project on a set of retail sales analysis


# Project Title: Retail Sales Analysis

# Project Overview
This data analysis project is aim to generate insights into the general sales performance, customer’s interest and market’s trends of a local retail store. Using the various parameters given to analyze, we seek to gather various insights to make compelling insights to make decisions that will improve the performance of the retail store.
# Data Sources
The data source is an excel csv. File obtained for this project. This file contains information like,
Transaction id, sale time, sale date, customer id, category, customer age, etc... 
# Tools Used
- Microsoft Excel for data preparation
- Microsoft SQL Server for data cleaning, data querying and data analysis
- Git Hub for portfolio building
# Objectives
Data Preparation: Prepare data for analysis
Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
Data Cleaning: Identify and remove any records with missing or null values.
Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.
Project Structure
1. Data Preparation
Data is prepared by importing the csv file on Excel to understand the data and perform various data cleaning before exporting to the data base
2. Database Setup
Database Creation: The project starts by creating a database named SQLRETAIL
Table Creation: A table file is imported from excel and named SALES RETAIL DATA. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount. With the table structure being

```SQL
CREATE DATABASE SQLRETAIL;
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
```

3. Data Exploration & Cleaning
Record Count: Determine the total number of records in the dataset.
Customer Count: Find out how many unique customers are in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null Value Check: Check for any null values in the dataset and delete records with missing data.
```SQL
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```
4. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

Q1. Write a SQL query to retrieve all the sales made on 2022-11-05

  Select * from [SALES RETAIL DATA] 
  where Sale_date = '2022-11-05'

Q2. Write a SQL query to retrieve all transactions where the category is clothing and 
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

Q3. Write a SQL query to calculate the total sales for each category

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
Findings
Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.
Reports
Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.
Trend Analysis: Insights into sales trends across different months and shifts.
Customer Insights: Reports on top customers and unique customer counts per category.
Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.


