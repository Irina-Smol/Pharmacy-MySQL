--! 1
SELECT * FROM supplier WHERE MONTH(agreement_date)=3 AND YEAR(agreement_date)=2020
--! 2
SELECT name FROM supplier WHERE end_date BETWEEN date_sub(current_date(), INTERVAL 5 DAY) AND current_date()
--! 3
SELECT city, count(name) FROM supplier GROUP BY city
--! 4
SELECT id_b, amount FROM order_line WHERE id_b = 3
--! 5
SELECT drug.group, COUNT(*) FROM drug GROUP BY drug.group
--! 6
SELECT MIN(order_line.price) FROM order_line WHERE id_b = 3
