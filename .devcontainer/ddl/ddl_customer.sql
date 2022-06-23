CREATE TABLE customer_tb
(
  customer_id      TEXT NOT NULL,
  age         	   INTEGER NOT NULL,
  sex      		   TEXT NOT NULL,
  home_latitude    NUMERIC NOT NULL,
  home_longitude   NUMERIC NOT NULL,
  primary key(customer_id)
);

COPY customer_tb
(
  customer_id,
  age,
  sex,
  home_latitude,
  home_longitude
)
FROM '/var/lib/postgresql/csvs/customer.csv'
DELIMITER ',' CSV HEADER;
