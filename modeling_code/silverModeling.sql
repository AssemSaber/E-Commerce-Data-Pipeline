-- Customers
CREATE EXTERNAL TABLE IF NOT EXISTS silver.customers (
  customer_id        STRING,
  customer_unique    STRING,
  zip_code_prefix    STRING,
  city               STRING,
  state              STRING
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/customers';

-- Orders
CREATE EXTERNAL TABLE IF NOT EXISTS silver.orders (
  order_id                STRING,
  customer_id             STRING,
  status                  STRING,
  purchase_timestamp      TIMESTAMP,
  approved_at             TIMESTAMP,
  delivered_carrier_date  TIMESTAMP,
  delivered_customer_date TIMESTAMP,
  estimated_delivery_date TIMESTAMP
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/orders';

-- Order Items
CREATE EXTERNAL TABLE IF NOT EXISTS silver.order_items (
  order_id            STRING,
  item_id             STRING,
  product_id          BIGINT,
  seller_id           BIGINT,
  shipping_limit_date TIMESTAMP,
  price               FLOAT,
  freight_value       FLOAT
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/order_items';

-- Payments
CREATE EXTERNAL TABLE IF NOT EXISTS silver.payments (
  order_id              STRING,
  payment_sequential    BIGINT,
  payment_type          STRING,
  payment_installments  STRING,
  payment_value         FLOAT
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/payments';

-- Reviews
CREATE EXTERNAL TABLE IF NOT EXISTS silver.reviews (
  review_id                STRING,
  order_id                 STRING,
  review_score             BIGINT,
  comment_title            STRING,
  comment_message          STRING,
  review_creation_date     TIMESTAMP,
  review_answer_timestamp  TIMESTAMP
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/reviews';

-- Products
CREATE EXTERNAL TABLE IF NOT EXISTS silver.products (
  product_id               STRING,
  category_name            STRING,
  product_name_length      INT,
  product_description_length STRING,
  product_photos_qty       BIGINT,
  product_weight_g         FLOAT,
  product_length_cm        FLOAT,
  product_height_cm        FLOAT,
  product_width_cm         FLOAT
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/products';

-- Sellers
CREATE EXTERNAL TABLE IF NOT EXISTS silver.sellers (
  seller_id       STRING,
  zip_code_prefix STRING,
  city            STRING,
  state           STRING
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:8020/silver/sellers';
