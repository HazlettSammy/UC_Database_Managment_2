-- IT 3060 Week 2 Troubleshooting Lab
USE Bikestores;

-- #1 SELECT ALL RECORDS FROM PRODUCTS
SELECT * 
FROM production.products;
-- Fix: Missing * in front of SELECT

-- #2 SELECT ALL RECORDS FROM PRODUCTS and BRANDS
SELECT * 
FROM production.products
JOIN production.brands ON production.products.brand_id = production.brands.brand_id;
-- Fix: Missing the JOIN condition. Added a JOIN clause to connect "products" and "brands" via "brand_id".

-- #3 SELECT ALL PRODUCTS WITH THE BRAND Name = 'Strider'
SELECT * 
FROM production.products
JOIN production.brands ON production.products.brand_id = production.brands.brand_id
WHERE production.brands.brand_name = 'Strider';
-- Fix: Missing JOIN condition and the "Strider" brand name was not quoted.

-- #4 Give the column displayed an alias of staffname
SELECT CONCAT(first_name, ' ', last_name) AS staffname
FROM sales.staffs;
-- Fix: The alias for the concatenated name wasn't added. Added "AS staffname" to give the concatenated column a clear alias.

-- #5 Display a count of staff members per store
SELECT store_id, COUNT(staff_id) AS staff_count
FROM sales.staffs
GROUP BY store_id;
-- Fix: Added GROUP BY store_id to ensure the count of staff members is calculated per store.

-- #6 Display all the orders and their products
SELECT orders.order_id, order_items.product_id, order_items.quantity
FROM sales.orders 
INNER JOIN sales.order_items ON orders.order_id = order_items.order_id;
-- Fix: Corrected the INNER JOIN clause to link the two tables on the "order_id" field.

-- #7 Locate the store with the most items in stock
SELECT TOP 1 store_id, SUM(quantity) AS total_stock
FROM production.stocks
GROUP BY store_id
ORDER BY total_stock DESC;
-- Fix: GROUP BY clause was added to group the results by store_id so that we can sum the quantities per store. 

-- #8 Display each order and the product names ordered
SELECT orders.order_id, products.product_name
FROM sales.orders
JOIN sales.order_items ON orders.order_id = order_items.order_id
JOIN production.products ON order_items.product_id = products.product_id;
-- Fix: Added JOINs between orders, order_items, and products to ensure the correct relationships between these tables for retrieving the product names.
