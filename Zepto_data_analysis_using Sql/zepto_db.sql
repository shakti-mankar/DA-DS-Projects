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

