SELECT TOP 1
    sales.orders.order_id,
    sales.orders.customer_id,
    sales.orders.order_status,
    sales.orders.order_date,
    sales.orders.required_date,
    sales.orders.shipped_date,
    sales.orders.store_id,
    sales.orders.staff_id,
    (sales.order_items.quantity * production.products.list_price) AS Order_Total
FROM sales.orders
JOIN sales.order_items ON sales.orders.order_id = sales.order_items.order_id
JOIN production.products ON sales.order_items.product_id = production.products.product_id
ORDER BY Order_Total DESC;
