--Scott Browning, Samuel Hazlett
--part 1

SELECT * FROM production.brands;

SELECT * FROM production.brands
WHERE brand_name = 'Electra'

SELECT * 
FROM sales.stores
WHERE store_name = 'Santa Cruz Bikes';

SELECT  FIRST_NAME, LAST_NAME
FROM sales.customers
WHERE FIRST_NAME = 'debra' AND LAST_NAME = 'burks';

--part 2 (this took like 25 minutes to figure out)
SELECT 
    c.FIRST_NAME, 
    c.LAST_NAME, 
    o.customer_id, 
    o.order_date, 
    o.order_status
FROM 
    sales.customers c
JOIN 
    sales.orders o
ON 
    c.customer_id = o.customer_id

SELECT 
    p.product_name, 
    c.category_name, 
    b.brand_name, 
    p.model_year, 
    p.list_price
FROM 
    production.products p
JOIN 
    production.categories c
ON 
    p.category_id = c.category_id
JOIN 
    production.brands b
ON 
    p.brand_id = b.brand_id
WHERE 
    b.brand_name = 'Electra';

--part 3
	SELECT 
    p.product_name, 
    p.list_price, 
    s.store_name, 
    st.quantity
FROM 
    production.products p
JOIN 
    production.brands b
ON 
    p.brand_id = b.brand_id
JOIN 
    production.stocks st
ON 
    p.product_id = st.product_id
JOIN 
    sales.stores s
ON 
    st.store_id = s.store_id
WHERE 
    b.brand_name = 'Electra'
ORDER BY 
    s.store_name ASC;
	--parts 4

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM sales.customers;

SELECT COUNT(*) AS total_staff
FROM sales.staffs s
JOIN sales.stores st
ON s.store_id = st.store_id
WHERE st.store_name = 'Santa Cruz Bikes';

SELECT COUNT(*) AS total_orders
FROM sales.customers c
JOIN sales.orders o
ON c.customer_id = o.customer_id
WHERE c.first_name = 'Pamelia' AND c.last_name = 'Newman';

--part 5
SELECT 
    oi.order_id, 
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_price
FROM 
    sales.order_items oi
GROUP BY 
    oi.order_id
HAVING 
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) > (
        SELECT 
            AVG(order_total)
        FROM (
            SELECT 
                SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_total
            FROM 
                sales.order_items oi
            GROUP BY 
                oi.order_id
        ) AS order_totals
    );

	SELECT 
    s.store_name, 
    CONCAT(s.street, ', ', s.city, ', ', s.state, ' ', s.zip_code) AS address, 
    SUM(oi.quantity) AS total_stock
FROM 
    sales.stores s
JOIN 
    sales.orders o
ON 
    s.store_id = o.store_id
JOIN 
    sales.order_items oi
ON 
    o.order_id = oi.order_id
GROUP BY 
    s.store_id, s.store_name, s.street, s.city, s.state, s.zip_code
ORDER BY 
    total_stock DESC
;
