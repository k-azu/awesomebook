\c awesomebk

COPY work.customer_tb
FROM '/var/lib/postgresql/csvs/customer.csv'
DELIMITER ',' CSV HEADER;

COPY work.holiday_mst
FROM '/var/lib/postgresql/csvs/holiday_mst.csv'
DELIMITER ',' CSV HEADER;

COPY work.hotel_tb
FROM '/var/lib/postgresql/csvs/hotel.csv'
DELIMITER ',' CSV HEADER;

COPY work.month_mst 
FROM '/var/lib/postgresql/csvs/month_mst.csv'
DELIMITER ',' CSV HEADER;

COPY work.production_tb
FROM '/var/lib/postgresql/csvs/production.csv'
DELIMITER ',' CSV HEADER;

COPY work.production_missn_tb
FROM '/var/lib/postgresql/csvs/production_missing_num_4_redshift.csv'
DELIMITER ',' CSV HEADER;

COPY work.reserve_tb
FROM '/var/lib/postgresql/csvs/reserve.csv'
DELIMITER ',' CSV HEADER;
