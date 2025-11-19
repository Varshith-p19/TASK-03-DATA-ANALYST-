# TASK-03-DATA-ANALYST-
DATA ANALYST 

This project is based on an E-commerce sales dataset containing Orders, Customers, and Products.
The goal is to perform real-world SQL operations such as:

Data cleaning

Joins (INNER, LEFT, RIGHT)

Grouping and aggregations

Subqueries

Creating views for analysis

Basic query optimization

This project shows my ability to work with structured data and generate business insights.


1. Orders Table
Contains sales transaction details
OrderID
CustomerID
ProductID
OrderDate
Quantity
Price

2. Customers Table

Contains customer information
CustomerID
CustomerName
City

3. Products Table

Stores product catalog
ProductID
ProductName
Categor

1. Performed

INNER JOIN (Orders + Customers + Products)

LEFT JOIN (All customers even without orders)

RIGHT JOIN (Product-focused view)

2.GROUP BY + Aggregations Calculated: Total quantity sold, Total revenue, Revenue by customer,Revenue by product.

3.Subqueries

Used subqueries for tasks like:
Finding orders above average value
Highest spending customer
Top-selling product

4.Views for Analysis

Created reusable views such as:
vw_OrderAnalysis → Full combined order dataset
vw_ProductSalesSummary → Product-level revenue

