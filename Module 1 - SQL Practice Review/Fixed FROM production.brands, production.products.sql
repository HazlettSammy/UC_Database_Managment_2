SELECT *
FROM production.brands
INNER JOIN production.products
ON production.brands.brand_id = production.products.brand_id;