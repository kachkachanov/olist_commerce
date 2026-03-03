SELECT orders.order_status,Count(order_id) AS count_orders
FROM orders
GROUP BY orders.order_status
ORDER BY count_orders DESC;