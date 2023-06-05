--! 1
SELECT drug.id_d, drug.name, SUM(order_line.amount) AS 'amount' 
FROM rk6_schema.order_line 
JOIN rk6_schema.order ON order_line.id_a = rk6_schema.order.id_o 
JOIN drug ON order_line.id_b = drug.id_d 
WHERE YEAR(rk6_schema.order.date_preparation) = 2020 AND MONTH(rk6_schema.order.date_preparation) = 3 
GROUP BY drug.id_d
--! 2
SELECT supplier.id_s, supplier.name, SUM(rk6_schema.order.price) as 'price' 
FROM rk6_schema.order 
JOIN supplier ON supplier.id_s = rk6_schema.order.id_a
WHERE YEAR(rk6_schema.order.date_preparation) = 2020 AND MONTH(rk6_schema.order.date_preparation) = 3

--! 3
SELECT id_s, agreement_date, supplier.name, city, end_date 
FROM supplier 
JOIN rk6_schema.order ON id_s = rk6_schema.order.id_a JOIN  ( 		
    SELECT id_a, id_b, MAX(price) 		
    FROM order_line        
    WHERE id_b = 1 ) 
AS price_xxx ON (price_xxx.id_a = rk6_schema.order.id_o)
--! 4
SELECT id_s, agreement_date, supplier.name, city, end_date 
FROM rk6_schema.supplier 
LEFT JOIN rk6_schema.order ON (id_s = rk6_schema.order.id_a) 
WHERE id_o IS NULL
--! 5
SELECT * FROM supplier 
WHERE id_s NOT IN ( 
  SELECT id_s 
  FROM rk6_schema.supplier 
  LEFT JOIN rk6_schema.order ON (id_s = rk6_schema.order.id_a) 
  WHERE YEAR(date_preparation) = 2020 AND MONTH(date_preparation) = 3 
)
--! 6
SELECT count, agreement_date, name, city, end_date 
FROM new_view 
WHERE count = (
  SELECT MAX(count) 
  FROM new_view)
