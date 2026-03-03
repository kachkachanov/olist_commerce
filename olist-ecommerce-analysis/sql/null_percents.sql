SELECT
    ROUND((COUNT(*) - COUNT(customer_unique_id))::NUMERIC / COUNT(*) * 100, 2) AS percent_null_unique_id,
    ROUND((COUNT(*) - COUNT(zip_code))::NUMERIC / COUNT(*) * 100, 2) AS percent_null_zip_code,
    ROUND((COUNT(*) - COUNT(city))::NUMERIC / COUNT(*) * 100, 2) AS percent_null_city,
    ROUND((COUNT(*) - COUNT(state))::NUMERIC / COUNT(*) * 100, 2) AS percent_null_state
FROM customers;

SELECT ROUND((COUNT(*)-COUNT(zip_code))::NUMERIC/COUNT(*)*100,2) as percent_null_zip_code,
       ROUND((COUNT(*)-COUNT(geolocation_lat))::NUMERIC/COUNT(*)*100,2) AS percent_null_geolocation_lat,
       ROUND((COUNT(*)-COUNT(geolocation_lng))::NUMERIC/COUNT(*)*100,2) AS percent_null_city,
       ROUND((COUNT(*)-COUNT(state))::NUMERIC/COUNT(*)*100,2) AS percent_null_state
FROM geolocation;

SELECT
    ROUND((COUNT(*)-COUNT(product_id))::NUMERIC/COUNT(*)*100,2 ) as percent_null_product_id,
    ROUND((COUNT(*)-COUNT(seller_id))::NUMERIC/COUNT(*)*100,2) AS percent_null_seller_id,
    ROUND((COUNT(*)-COUNT(shipping_limit_date))::NUMERIC/COUNT(*)*100,2) AS percent_null_shipping_limit_date,
    ROUND((COUNT(*)-COUNT(price))::NUMERIC/COUNT(*)*100, 2) AS percent_null_order_items,
    ROUND((COUNT(*)-COUNT(freight_value))::NUMERIC/COUNT(*)*100, 2) AS percent_null_freight_value
FROM order_items;

SELECT
    ROUND((COUNT(*)-COUNT(orders.customer_id))::NUMERIC/COUNT(*)*100,2 ) as percent_null_customer_id,
    ROUND((COUNT(*)-COUNT(order_status))::NUMERIC/COUNT(*)*100,2) AS percent_null_order_status,
    ROUND((COUNT(*)-COUNT(purchase_timestamp))::NUMERIC/COUNT(*)*100,2) AS percent_null_purchase_timestamp,
    ROUND((COUNT(*)-COUNT(approved_at))::NUMERIC/COUNT(*)*100, 2) AS percent_null_approved_at,
    ROUND((COUNT(*)-COUNT(delivered_carrier_date))::NUMERIC/COUNT(*)*100, 2) AS percent_null_delivered_carrier_date,
    ROUND((COUNT(*)-COUNT(delivered_customer_date))::NUMERIC/COUNT(*)*100, 2) AS percent_null_delivered_customer_date,
    ROUND((COUNT(*)-COUNT(estimated_delivery_date))::NUMERIC/COUNT(*)*100, 2) AS percent_null_estimated_delivery_date
FROM orders;

SELECT
    ROUND((COUNT(*)-COUNT(payment_type))::NUMERIC/COUNT(*)*100,2 ) as percent_null_payment_type,
    ROUND((COUNT(*)-COUNT(payment_installments))::NUMERIC/COUNT(*)*100,2) AS percent_null_payment_installments,
    ROUND((COUNT(*)-COUNT(payment_value))::NUMERIC/COUNT(*)*100,2) AS percent_null_payment_value
FROM payments;

SELECT
    ROUND((COUNT(*)-COUNT(category_name))::NUMERIC/COUNT(*)*100,2 ) as percent_null_category_name,
    ROUND((COUNT(*)-COUNT(name_length))::NUMERIC/COUNT(*)*100,2) AS percent_null_name_length,
    ROUND((COUNT(*)-COUNT(description_length))::NUMERIC/COUNT(*)*100,2) AS percent_null_description_length,
    ROUND((COUNT(*)-COUNT(photos_qty))::NUMERIC/COUNT(*)*100, 2) AS percent_null_photos_qty,
    ROUND((COUNT(*)-COUNT(weight_g))::NUMERIC/COUNT(*)*100, 2) AS percent_null_weight_g,
    ROUND((COUNT(*)-COUNT(length_cm))::NUMERIC/COUNT(*)*100, 2) AS percent_null_length_cm,
    ROUND((COUNT(*)-COUNT(height_cm))::NUMERIC/COUNT(*)*100, 2) AS percent_null_height_cm,
    ROUND((COUNT(*)-COUNT(width_cm))::NUMERIC/COUNT(*)*100, 2) AS percent_null_width_cm
FROM products;

SELECT
    ROUND((COUNT(*)-COUNT(order_id))::NUMERIC/COUNT(*)*100,2 ) as percent_null_order_id,
    ROUND((COUNT(*)-COUNT(review_score))::NUMERIC/COUNT(*)*100,2) AS percent_null_review_score,
    ROUND((COUNT(*)-COUNT(comment_title))::NUMERIC/COUNT(*)*100,2) AS percent_null_comment_title,
    ROUND((COUNT(*)-COUNT(comment_message))::NUMERIC/COUNT(*)*100, 2) AS percent_null_comment_message
FROM reviews;

SELECT
    ROUND((COUNT(*)-COUNT(zip_code))::NUMERIC/COUNT(*)*100,2 ) as percent_null_zip_code,
    ROUND((COUNT(*)-COUNT(city))::NUMERIC/COUNT(*)*100,2) AS percent_null_city,
    ROUND((COUNT(*)-COUNT(state))::NUMERIC/COUNT(*)*100,2) AS percent_null_state
FROM sellers;