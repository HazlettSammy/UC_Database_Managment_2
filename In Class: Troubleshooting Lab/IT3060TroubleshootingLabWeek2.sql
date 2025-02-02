--IT 3060 Week 2 Troubleshooting Lab
USE Bikestores

--#1 SELECT ALL RECORDS FROM PRODUCTS
Select 
From production.products

--#2 SELECT ALL RECORDS FROM PRODUCTS and BRANDS
SELECT *
From production.products, production.brands

--#3 SELECT ALL PRODUCTS WITH THE BRAND Name = Strider
SELECT *
FROM production.products, production.brands
WHERE brand_name = Strider

--#4 Give the column displayed an alias of staffname
Select CONCAT(first_name, ' ' , last_name)
From sales.staffs

--#5 Display a count of staff members per store
SELECT store_id, COUNT(staff_id)
FROM sales.staffs

--#6 Display all the orders and their products
SELECT order_id, product_id, quantity
From sales.orders inner join sales.order_items on
orders.order_id = order_items.order_id

--#7 Locate the store with the most items in stock
SELECT store_id, SUM(quantity)
FROM production.stocks

--#8 Display each order and the product names ordered
SELECT order_id, product_name
FROM sales.orders, production.products

