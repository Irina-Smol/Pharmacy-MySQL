CREATE VIEW `new_view` AS
SELECT id_s, agreement_date, supplier.name, city, end_date
FROM supplier
JOIN rk6_schema.order ON id_s = rk6_schema.order.id_a
JOIN rk6_schema.order_line ON rk6_schema.order.id_o = rk6_schema.order_line.id_a