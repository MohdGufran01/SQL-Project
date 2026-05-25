---Pull the data and check about the null values
select * from Retail_Store
where transactions_id is NULL or sale_date is null or sale_time is null or customer_id is null or gender is NULL or age is NULL
or category is NULL or quantiy is NULL or price_per_unit is NULL or cogs is NULL or total_sale is NULL

---Delete the null values from the data
DELETE from Retail_Store
where transactions_id is NULL or sale_date is null or sale_time is null or customer_id is null or gender is NULL or age is NULL
or category is NULL or quantiy is NULL or price_per_unit is NULL or cogs is NULL or total_sale is NULL

---How many sales transactions has been done in total 
select count(*) as Total_Transations from Retail_Store

---How many customers have made the transactions
Select count(DISTINCT(customer_id)) as Number_of_Customers from Retail_Store

---How many categories are there
select DISTINCT(category) as Category_list from Retail_Store

---Write the query to reterive all columns where sales has been done on '2022-11-05'
SELECT * from Retail_Store
where sale_date = '2022-11-05'

---write the sql query to calcuate the total sales for each category
select category, sum(total_sale) as Total_sales from Retail_Store
group by category

---write the sql query to find the average age of customers who purchased items from 'Beauty' category
select AVG(Age) as Average_Age from Retail_Store
where category = 'Beauty'

---write the sql query to find all transactions where the total sale is greater then 1000
select * from Retail_Store
where total_sale > 1000

---write the sql query to find the total number of transaction (transactions_id) made by each gender in each category
Select gender, category, count(transactions_id) as Total_Transactions from Retail_Store
group by gender, category

---write the sql query to calculate the average sale for each month. find out best selling month of each year
select Avg(total_sale) as Avg_sales, strftime ('%m', sale_date) as Months, strftime('%Y', sale_date) as Years from Retail_Store
group by  Months, Years
order by Avg_sales DESC

---Write sql query to find top 5 customers based on the highest total saleRetail_Store
select customer_id, total_sale from Retail_Store
order by total_sale DESC
limit 5

---Write the sql query to find the number of unique customers who purchased items from each category.
select count(DISTINCT(customer_id)) as Unique_Customers, category from Retail_Store
group by category

---Write the sql query to create each shift and number of orders (example morning<=12, afternoon between 12 & 17, Evening >17)
select count(transactions_id) as Number_of_Orders,
case when CAST( strftime('%H', sale_time) as real)<= 12 then 'Morning'
     when  Cast (strftime('%H', sale_time) as real) between 12 and 17 then 'Afternoon'
     when  CAST( strftime('%H', sale_time) as real)>17 then 'Evening'
     else 'Unknown'
     end as Shift
     from Retail_Store
group by shift

---write the sql query to retrevie all transactions where category is 'clothing' and the quantity sold is more than 10 in
---month of Nov 2022.

select * from Retail_Store
where category = 'Clothing' and quantiy > 2 and strftime('%Y-%m', sale_date) = '2022-11'