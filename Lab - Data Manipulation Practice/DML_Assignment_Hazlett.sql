-- 1. Insert a new brand name into the production.brands table
INSERT INTO production.brands (brand_name) 
VALUES ('New Brand Name');

-- 2. Update the production.categories table to rename "Mountain Bikes" to "Mountain Adventure Bikes"
UPDATE production.categories
SET category_name = 'Mountain Adventure Bikes'
WHERE category_name = 'Mountain Bikes';

-- 3. Delete the customer Charolette Rice from the sales.customers table
DELETE FROM sales.customers
WHERE first_name = 'Charolette' AND last_name = 'Rice';

-- 4. Insert 2 new customers into the sales.customers table
INSERT INTO sales.customers (first_name, last_name, phone, email, street, city, state, zip_code)
VALUES 
    ('John', 'Doe', '123-456-7890', 'johndoe@email.com', '123 Elm Street', 'Springfield', 'IL', '62701'),
    ('Jane', 'Smith', '987-654-3210', 'janesmith@email.com', '456 Oak Avenue', 'Columbus', 'OH', '43215');

-- 5. Modify the sales.stores table column email to be varchar(50)
ALTER TABLE sales.stores
ALTER COLUMN email VARCHAR(50);

-- 6. Query to return all product names and their length, sorted by length in descending order
SELECT 
    product_name, 
    LEN(product_name) AS name_length
FROM production.products
ORDER BY name_length DESC;

-- 7. Query to return staff name as a single column sorted by last name in ascending order
SELECT 
    CONCAT(first_name, ' ', last_name) AS staff_name
FROM sales.staffs
ORDER BY last_name ASC;
