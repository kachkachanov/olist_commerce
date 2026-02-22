CREATE TABLE customers(
    customer_id VARCHAR(50) NOT NULL PRIMARY KEY,
    customer_unique_id VARCHAR(50) NOT NULL,
    zip_code INT,
    customer_city VARCHAR(25),
    customer_state VARCHAR(5)
);

ALTER TABLE customers
ALTER COLUMN customer_city
    TYPE VARCHAR(100);

CREATE TABLE geolocation(
    zip_code INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city varchar(100),
    geolocation_state VARCHAR(5)
);
CREATE TABLE sellers(
    seller_id VARCHAR(50) NOT NULL PRIMARY KEY,
    zip_code INT,
    city VARCHAR(100),
    state VARCHAR(5)
);
ALTER TABLE customers
RENAME COLUMN customer_city TO city;
ALTER TABLE customers
RENAME COLUMN customer_state TO state;
ALTER TABLE geolocation
RENAME COLUMN geolocation_city TO city;
ALTER TABLE geolocation
RENAME COLUMN geolocation_state TO state;

CREATE TABLE products(
    product_id VARCHAR(50) NOT NULL PRIMARY KEY,
    category_name VARCHAR(100),
    name_length INT,
    description_length INT,
    photos_qty INT,
    weight_g INT,
    length_cm INT,
    height_cm INT,
    width_cm INT
);
CREATE TABLE orders(
    order_id VARCHAR(50) NOT NULL PRIMARY KEY ,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    purchase_timestamp TIMESTAMP,
    approved_at TIMESTAMP,
    delivered_carrier_date TIMESTAMP,
    delivered_customer_date TIMESTAMP,
    estimated_delivery_date TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);
CREATE TABLE order_items(
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price FLOAT,
    freight_value FLOAT,
    PRIMARY KEY (order_id,order_item_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE payments(
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(25),
    payment_installments INT,
    payment_value FLOAT,
    PRIMARY KEY (order_id, payment_sequential),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE reviews(
    review_id VARCHAR(50) NOT NULL PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INT,
    comment_title VARCHAR(50),
    comment_message TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
)