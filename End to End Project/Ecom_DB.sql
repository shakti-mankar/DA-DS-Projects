Create database Ecommerce;

use Ecommerce;

select * from orders;



select Delivery_Date from orders;
-- Total Orders

select count(*) as Total_orders from orders;

-- Total Sales

select sum(Net_Amount) as Total_Sales from orders;

-- Top order

Select product , sum(net_amount) as Sales
from orders
group by product
order by sales desc;


-- Top cities

select City, sum(Net_amount) as Sales
from orders
Group by City
order by Sales desc;

-- Month wise sales

select Month, Sum(Net_amount) as Sales
from orders 
group by Month
order by sales desc;


-- Highest profit product 
 
select Product , sum(profit) as profit_sales
from orders
group by Product
order by  profit_sales desc;


--  distribution by payment type 

select Payment_Mode , count(*) as Total_order
from orders
group by Payment_Mode;


-- canceled orders

select * from orders 
where Order_Status = 'Cancelled';
 
