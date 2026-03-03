--Подсчёт количества клиентов, которые покупали ≥ 2 раза
WITH c_count AS(
    SELECT COUNT(customer_id) AS count_customer
    FROM customers
    GROUP BY customer_unique_id
)
SELECT COUNT(count_customer)
FROM c_count
WHERE count_customer >= 2;
--Сегментация клиентов: NEW / CHURN
WITH c_count AS(
    SELECT COUNT(orders.customer_id) AS cust_count
    FROM orders
    JOIN customers c on c.customer_id = orders.customer_id
    GROUP BY c.customer_unique_id
)
SELECT CASE WHEN cust_count = 1 THEN 'NEW'
WHEN cust_count >= 2 THEN 'CHURN'
END AS c_group, COUNT(*) AS count_customers, ROUND(COUNT(*)::NUMERIC/SUM(COUNT(*)) OVER ()*100, 2) AS percent
FROM c_count
GROUP BY c_group;
--Рейтинг категорий по количеству продаж
WITH c_count AS(
    SELECT p.category_name, COUNT(order_items.seller_id) AS r_count
    FROM order_items
    JOIN products p on p.product_id = order_items.product_id
    GROUP BY p.category_name
)
SELECT category_name, r_count, DENSE_RANK() OVER (ORDER BY r_count DESC)
FROM c_count;
-- Кумулятивная сумма платежей по месяцам
WITH c_date AS
    (SELECT DATE_TRUNC('month', purchase_timestamp) as p_month, ROUND(SUM(p.payment_value)::NUMERIC, 2) as sum_value
                FROM orders
                         JOIN payments p on orders.order_id = p.order_id
                GROUP BY p_month
                )
SELECT p_month, sum_value, SUM(sum_value) OVER (ORDER BY p_month)
FROM c_date;
--Доля категорий в общей выручке
WITH c_name AS (SELECT products.category_name, ROUND(SUM(p.payment_value)::NUMERIC, 2) AS sum_payments
                FROM products
                         JOIN order_items oi on products.product_id = oi.product_id
                         JOIN orders o on o.order_id = oi.order_id
                         JOIN payments p on o.order_id = p.order_id
                GROUP BY products.category_name
                )
SELECT category_name, sum_payments, ROUND((sum_payments/SUM(sum_payments) OVER ()*100)::NUMERIC, 2) AS percent
FROM c_name
ORDER BY sum_payments DESC;
