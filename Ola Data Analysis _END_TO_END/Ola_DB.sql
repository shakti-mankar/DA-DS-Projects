create database ola;

use ola;

select * from bookings;

-- 1. Retrieve all successful bookings.

Create View Successful_Bookings AS
select * from bookings
Where Booking_status = 'Success';


select * from Successful_Bookings; 



-- 2. Find the average ride distance for each vehicle type.

CREATE VIEW RIDE_DISTANCE_FOR_EACH_VEHICLE AS
SELECT VEHICLE_TYPE, AVG(RIDE_DISTANCE)
AS AVG_DISTANCE FROM BOOKINGS
GROUP BY VEHICLE_TYPE;

SELECT * FROM RIDE_DISTANCE_FOR_EACH_VEHICLE;

-- 3. Get the total number of canceled rides by customers.

CREATE VIEW CANCELED_RIDES AS
SELECT COUNT(BOOKING_STATUS) AS CANCELED_BOOKINGS FROM BOOKINGS
WHERE  BOOKING_STATUS = "CANCELED BY CUSTOMER";
 
 SELECT * FROM CANCELED_RIDES;
 
 CREATE VIEW CANCELED_RIDES_BY_CUSTOMERS AS
 SELECT COUNT(*) FROM BOOKINGS
 WHERE BOOKING_STATUS = "CANCELED BY CUSTOMER";
 
 SELECT * FROM CANCELED_RIDES_BY_CUSTOMERS;
 
-- 4. List the top 5 customers who booked the highest number of rides.

CREATE VIEW TOP_CUSTOMERS AS 
SELECT CUSTOMER_ID , COUNT(BOOKING_ID) AS TOTAL_RIDES
FROM BOOKINGS 
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_RIDES desc LIMIT 5;

SELECT * FROM TOP_CUSTOMERS;


-- 5. Get the number of rides canceled by drivers due to personal and car-related issues.

SELECT count(*) from bookings 
where Canceled_rides_by_Driver = "Personal & Car related issue";
 

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings.

create view Max_min_ratings_for_prime_sedan as
select max(Driver_ratings) , min(Driver_ratings) from bookings
where vehicle_type = "Prime sedan";

select * from Max_min_ratings_for_prime_sedan;

-- 7. Retrieve all rides where payment was made using UPI.

 create view UPI_payment_rides as 
select Booking_id , Payment_method from bookings
where Payment_method = "UPI";

select * from UPI_payment_rides;

-- 8. Find the average customer rating per vehicle type.

create view avg_cus_ratings_per_vehicle as
select vehicle_type , avg(customer_rating) from bookings
group by vehicle_type;

select * from avg_cus_ratings_per_vehicle;

-- 9. Calculate the total booking value of rides completed successfully.
create view total_success_bookings_value as
select sum(booking_value) from bookings
where booking_status = "Success";

select * from total_success_bookings_value;




-- 10. List all incomplete rides along with the reason.

create view incomplete_rides_with_reasons as 
select booking_id, Incomplete_rides_reason from bookings 
where Incomplete_rides = "YES";


select * from incomplete_rides_with_reasons;
