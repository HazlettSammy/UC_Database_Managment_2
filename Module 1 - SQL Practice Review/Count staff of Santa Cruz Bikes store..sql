SELECT *
FROM sales.staffs
WHERE store_id = (SELECT store_id FROM sales.stores WHERE store_name = 'Santa Cruz Bikes');