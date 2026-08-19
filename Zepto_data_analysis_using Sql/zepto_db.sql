create database zepto;

use zepto;

-- table creation 

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
); 





-- data exploration 

select * from orders;

-- Count of rows 
select count(*) from orders;

-- count of data 
select * from orders
limit 10;


-- null values

select * from orders
where name is null
or
Category is null
or 
mrp is null
or 
discountPercent is null
or 
availableQuantity  is null 
or
DiscountedSellingPrice is null
or
weightInGms is null
or 
outOfStock is null
or 
quantity is null;


--  renaming column 




-- Different product category

select distinct category 
from orders 
order by category;

-- product in stock vs out of stock 

select  outofstock , Count(SerialNo)
from orders
group by outOfstock; 


-- product names present multiple times 

select name , Count(SerialNo) as "number of IDS"
from orders
Group by Name
Having count(SerialNo) > 1
Order by count(SerialNo) Desc;
 
 
-- data cleaning
 
-- product price = 0

select * from orders
where mrp = 0 OR discountedSellingPrice = 0;

delete from orders 
where mrp = 0;

SET SQL_SAFE_UPDATES = 0;

-- COnvert paise into rupees

Update orders 
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from orders;

-- data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


select distinct name , mrp discountPercent
from orders
order by discountPercent desc
limit 10;

--  Q2.What are the Products with High MRP but Out of Stock



-- Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

