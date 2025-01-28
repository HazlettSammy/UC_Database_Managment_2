SELECT c.customer_id, c.first_name, c.last_name, order_counts.order_count
FROM (
    SELECT o.customer_id, COUNT(o.order_id) AS order_count
    FROM sales.orders o
    GROUP BY o.customer_id
) AS order_counts
JOIN sales.customers c ON c.customer_id = order_counts.customer_id
WHERE order_counts.order_count = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM sales.orders
        GROUP BY customer_id
    ) AS subquery
);