-- distribution count orders for payment type
SELECT payments.payment_type, COUNT(o.order_id) AS count_orders
FROM payments
JOIN orders o on o.order_id = payments.order_id
GROUP BY payments.payment_type
ORDER BY count_orders desc;
--distribution sum orders for payment type 
SELECT payments.payment_type, ROUND(SUM(payment_value)::NUMERIC, 2) AS sum_orders
FROM payments
GROUP BY payments.payment_type
ORDER BY sum_orders desc;
--distribution count reviews for review score 
SELECT reviews.review_score, COUNT(reviews.review_score) AS count_reviews
FROM reviews
GROUP BY reviews.review_score
ORDER BY count_reviews DESC;