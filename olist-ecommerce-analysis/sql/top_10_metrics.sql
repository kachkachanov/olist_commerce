-- Top-10 count orders for categories 
SELECT p.category_name, COUNT(orders.order_id) AS count_orders
FROM orders
JOIN order_items ON orders.order_id=order_items.order_id
JOIN products p on p.product_id = order_items.product_id
GROUP BY p.category_name
ORDER BY count_orders desc
LIMIT 10;
--Top 10 value orders for categories
SELECT p.category_name, ROUND(SUM(p2.payment_value)::NUMERIC, 2) AS sum_orders
FROM orders
JOIN payments p2 on orders.order_id = p2.order_id
JOIN order_items ON orders.order_id=order_items.order_id
JOIN products p on p.product_id = order_items.product_id
GROUP BY p.category_name
ORDER BY sum_orders desc
LIMIT 10;
--Top 10 avg orders for categories 
SELECT p.category_name, ROUND(SUM(p2.payment_value)::NUMERIC/COUNT(orders.order_id), 2) AS avg_orders
FROM orders
JOIN payments p2 on orders.order_id = p2.order_id
JOIN order_items ON orders.order_id=order_items.order_id
JOIN products p on p.product_id = order_items.product_id
GROUP BY p.category_name
ORDER BY avg_orders desc
LIMIT 10;
--Top 10 value ordrs for sellers 
SELECT sellers.seller_id, ROUND(SUM(p.payment_value)::NUMERIC, 2) AS sum_sales
FROM sellers
JOIN order_items oi on sellers.seller_id = oi.seller_id
JOIN orders o on o.order_id = oi.order_id
JOIN payments p on o.order_id = p.order_id
GROUP BY sellers.seller_id
ORDER BY sum_sales desc
LIMIT 10;
--Top-10 state for count customers
SELECT state, COUNT(customers.customer_id) AS count_customers
FROM customers
GROUP BY state
ORDER BY count_customers desc
LIMIT 10;
