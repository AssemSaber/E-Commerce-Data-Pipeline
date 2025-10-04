CREATE EXTERNAL TABLE IF NOT EXISTS gold.dim_status (
  status_id     BIGINT,
  status_name   STRING
)
STORED AS PARQUET
LOCATION '/gold/dim_status';



CREATE EXTERNAL TABLE IF NOT EXISTS gold.dim_payments (
  payment_id     BIGINT,
  payment_type   STRING
)
STORED AS PARQUET
LOCATION '/gold/dim_payments';



CREATE EXTERNAL TABLE IF NOT EXISTS gold.dim_date (
  date_id     BIGINT,
  full_date   DATE,
  year        BIGINT,
  month       BIGINT,
  day         BIGINT,
  quarter     STRING
)
STORED AS PARQUET
LOCATION '/gold/dim_date';


CREATE EXTERNAL TABLE IF NOT EXISTS gold.dim_products (
  product_id     BIGINT,
  product_key    STRING,
  category_name  STRING
)
STORED AS PARQUET
LOCATION '/gold/dim_products';



CREATE EXTERNAL TABLE IF NOT EXISTS gold.dim_sellers (
  seller_id       BIGINT,
  seller_key      STRING,
  zip_code_prefix STRING,
  city            STRING,
  state           STRING
)
STORED AS PARQUET
LOCATION '/gold/dim_sellers';


CREATE EXTERNAL TABLE IF NOT EXISTS gold.dim_customers (
  customer_id      BIGINT,
  customer_unique  STRING,
  zip_code_prefix  STRING,
  city             STRING,
  state            STRING
)
STORED AS PARQUET
LOCATION '/gold/dim_customers';


CREATE EXTERNAL TABLE IF NOT EXISTS gold.fact_order_items (
  item_id                   STRING,
  status_id                 BIGINT,
  payment_id                BIGINT,
  product_id                STRING,
  seller_id                 STRING,
  customer_id               BIGINT,
  shipping_limit_date       BIGINT,
  purchase_timestamp        BIGINT,
  approved_at               BIGINT,
  delivered_carrier_date    BIGINT,
  delivered_customer_date   BIGINT,
  estimated_delivery_date   BIGINT,
  payment_installments       BIGINT,
  payment_value             FLOAT,
  price                     FLOAT,
  freight_value             FLOAT,
  review_score              BIGINT
)
STORED AS PARQUET
LOCATION '/gold/fact_order_items';
