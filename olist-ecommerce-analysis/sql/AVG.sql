-- Среднее время доставки по штатам
SELECT c.state, ROUND(AVG(EXTRACT(DAY FROM orders.delivered_customer_date-orders.purchase_timestamp))::NUMERIC, 2) AS avg_deliverytime
FROM orders
JOIN customers c on c.customer_id = orders.customer_id
WHERE delivered_customer_date IS NOT NULL
GROUP BY c.state
ORDER BY c.state;
--Средний месячный объём платежей
WITH s_payment as(
        SELECT DATE_TRUNC('month', orders.purchase_timestamp) as p_month, SUM(p.payment_value) as sum_p
            FROM orders
            JOIN payments p on orders.order_id = p.order_id
            GROUP BY p_month
    )
SELECT p_month, ROUND(AVG(sum_p)::NUMERIC,2) AS avg_sum
FROM s_payment
GROUP BY p_month
ORDER BY p_month;
--Сумма платежей по месяцам (без среднего)
SELECT
    DATE_TRUNC('month', orders.purchase_timestamp) AS p_month,
    ROUND(SUM(p.payment_value)::NUMERIC, 2) AS sum_p
FROM orders
JOIN payments p ON orders.order_id = p.order_id
GROUP BY p_month
ORDER BY p_month;
--Среднее количество товаров в заказе
WITH m_order AS(
    SELECT MAX(order_items.order_item_id) AS m_order
    FROM order_items
    GROUP BY order_id
)
SELECT ROUND(AVG(m_order)::NUMERIC, 2) AS avg_order
FROM m_order;

