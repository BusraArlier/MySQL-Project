# connect to database
USE store;

# QUERY 1

SELECT * FROM customers
ORDER BY first_name;

# QUERY 2
SELECT last_name, first_name, points, points + 10 
FROM CUSTOMERS;


# TASK 1

SELECT last_name, first_name, points, points + 10
FROM CUSTOMERS;

SELECT last_name, first_name, points, (points + 10) *100 
FROM CUSTOMERS;

SELECT last_name, first_name, points, (points + 10) *100 AS discount_factor
FROM CUSTOMERS; 

# TASK 2
 
SELECT * FROM products;
 
SELECT name, unit_price, (unit_price * 1.1) AS new_price
FROM products;

# TASK 3

SELECT * FROM customers
WHERE birth_date > '1990-01-01';

# EER DIAGRAM
-- customers entity
-- PRIMARY KEY is customer_id

-- products entity
-- PRIMARY KEY is product_id

-- Orders entity
-- PRIMARY KEY is order_id
-- FOREIGN KEYS ARE customer_id, shipper_id and order_status_id

-- order_items entity
-- Composite key is order_id and product_id 
 
-- shippers entity
-- PRIMARY KEY is shipper_id

-- order_statuses entity
-- PRIMARY KEY is order_status_id

# ADDITIONAL QUERIES

#1 To fetch Top 5 customers by Points (customer_id, first_name, last_name and points) ORDERED BY POINTS

SELECT customer_id, first_name, last_name, points FROM customers
WHERE points > 1000
ORDER BY points
LIMIT 5; 


#2 SELECT MIN, MAX AND AVERAGE 

SELECT MAX(points) FROM customers;

SELECT AVG(unit_price) FROM order_items;

SELECT MIN(points) FROM customers;

#3 Finding string starting with with a specific value (city name starts with 'C')
SELECT * FROM customers
WHERE city LIKE 'c%'; 

#4 Retrieve the first four characters of city name from customers table
SELECT SUBSTRING(city, 1, 4)
FROM customers;

#5 BETWEEN Clause

SELECT customer_id FROM orders
WHERE order_date BETWEEN '2017-01-01' AND '2017-02-01';

#6 HAVING Clause
SELECT COUNT(customer_id), state
FROM Customers
GROUP BY state
HAVING COUNT(customer_id) > 0;

#7 JOIN and ALIAS
SELECT c.customer_id, c.last_name, c.city, c.points,
o.status, o.shipped_date
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

#8 LEFT JOIN AND GROUP BY
SELECT o.order_id, SUM(o.quantity) AS 'Total Quantity',
SUM(p.quantity_in_stock) AS 'Total Stock Quantity'
FROM order_items AS o
LEFT JOIN products AS p
ON o.product_id=p.product_id
GROUP BY o.order_id;

#9 COALESCE (For rows with empty phone numbers, we can fill it in with the value 'Unknown'.)
SELECT phone,
COALESCE(phone, 'Unknown') AS phone_coalesced
FROM customers;

#10 
SELECT customer_id, order_id, status, order_date
FROM orders
WHERE (customer_id BETWEEN 1 AND 5 OR customer_id = 8)
AND status = 2; 


