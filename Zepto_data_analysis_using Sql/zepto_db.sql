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
ï»¿Category is null
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

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'orders';


-- Different product category

select distinct category 
from orders 
order by category;

-- product in stock vs out of stock 

select  outofstock , Count(sku_id)
from orders
group by outOfstock; 

drop table zepto;


