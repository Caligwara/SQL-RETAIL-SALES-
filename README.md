# SQL-RETAIL-SALES
MY SQL project on a set of retail sales analysis


# Project Title: Retail Sales Analysis

# Project Overview

This data analysis project is aim to generate insights into the general sales performance, customer’s interest and market’s trends of a local retail store. Using the various parameters given to analyze, we seek to gather various insights to make compelling insights to make decisions that will improve the performance of the retail store.
# Data Sources
The data source is an excel csv. File obtained for this project. This file contains information like,
Transaction id, sale time, sale date, customer id, category, customer age, etc... 
# Tools Used
Microsoft Excel for data preparation
Structured Query Language (SQL) for data cleaning, data querying and data analysis
Git Hub for portfolio building
# Objectives
Data Preparation: Prepare data for analysis
Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
Data Cleaning: Identify and remove any records with missing or null values.
Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.
Project Structure
1. Data Preparation
Data is prepared by importing the csv file on Excel to understand the data and perform various data cleaning before exporting to the data base
1. Database Setup
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

