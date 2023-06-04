USE rk6_schema;

#1. Составить отчет о заказах лекарств за март 2020 года по форме: Шифр лекарства, Название, общее количество в заказах.
SELECT drug.id_d, drug.name, SUM(order_line.amount) AS 'amount' FROM rk6_schema.order_line
JOIN rk6_schema.order ON order_line.id_a = rk6_schema.order.id_o
JOIN drug ON order_line.id_b = drug.id_d
WHERE YEAR(rk6_schema.order.date_preparation) = 2020 AND MONTH(rk6_schema.order.date_preparation) = 3
group by drug.id_d;

#2. Составить отчет о заказах за март 2020 года по форме: Шифр поставщика, название фирмы, общая сумма всех заказов.
SELECT supplier.id_s, supplier.name, SUM(rk6_schema.order.price) as 'price'
FROM rk6_schema.order JOIN supplier ON supplier.id_s = rk6_schema.order.id_a
WHERE YEAR(rk6_schema.order.date_preparation) = 2020 AND MONTH(rk6_schema.order.date_preparation) = 3;







#3. Покажите все сведения о поставщике, у которого было заказано самое дорогое лекарство с шифром ХХХ в марте 2020 года.
SELECT id_s, agreement_date, supplier.name, city, end_date
FROM supplier
JOIN rk6_schema.order ON id_s = rk6_schema.order.id_a
JOIN  (
		SELECT id_a, id_b, MAX(price)
		FROM order_line
        WHERE id_b = 1
) AS price_xxx ON (price_xxx.id_a = rk6_schema.order.id_o);

SELECT supplier.*
FROM supplier
JOIN rk6_schema.order ON id_s = rk6_schema.order.id_a
JOIN rk6_schema.order_line ON order_line.id_a = rk6_schema.order.id_o
JOIN rk6_schema.drug ON drug.id_d = order_line.id_b
WHERE year(date_preparation) = 2020 AND month(date_preparation) = 03 AND drug.name = 'XXX'
AND order_line.price = 
GROUP BY id_s;




#4. Показать все сведения о поставщике, с которым не было заключено ни одного заказа (с помощью левостороннего соединения)
SELECT id_s, agreement_date, supplier.name, city, end_date
FROM rk6_schema.supplier
LEFT JOIN rk6_schema.order ON (id_s = rk6_schema.order.id_a)
WHERE id_o IS NULL;

#5. Показать все сведения о поставщике, с которым не было заключено ни одного заказа в марте 2020 года.
SELECT * FROM supplier
WHERE id_s NOT IN (
SELECT id_s
FROM rk6_schema.supplier
LEFT JOIN rk6_schema.order ON (id_s = rk6_schema.order.id_a)
WHERE YEAR(date_preparation) = 2020 AND MONTH(date_preparation) = 3
);

#6. Показать все сведения о поставшике, чаще всех поставлявшего лекарство с шифром ХХХ в 2020 году (с помощью View).
SELECT count, agreement_date, name, city, end_date
FROM new_view
WHERE count = (SELECT MAX(count) FROM new_view);

