CREATE SCHEMA IF NOT EXISTS work;

DROP TABLE IF EXISTS work.customer;
CREATE TABLE work.customer (
    customer_id VARCHAR PRIMARY KEY,
    age INTEGER,
    sex VARCHAR,
    home_latitude FLOAT,
    home_longitude FLOAT,
);
COPY work.customer FROM 'data/customer.csv' (
    HEADER
);

DROP TABLE IF EXISTS work.hotel;
CREATE TABLE work.hotel (
    hotel_id VARCHAR PRIMARY KEY,
    base_price INTEGER,
    big_area_name VARCHAR,
    small_area_name VARCHAR,
    hotel_latitude FLOAT,
    hotel_longitude FLOAT,
    is_business BOOLEAN
);
COPY work.hotel FROM 'data/hotel.csv' (
    HEADER
);

DROP TABLE IF EXISTS work.reserve;
CREATE TABLE work.reserve (
    reserve_id VARCHAR PRIMARY KEY,
    hotel_id VARCHAR,
    customer_id VARCHAR,
    reserve_datetime TIMESTAMP,
    checkin_date DATE,
    checkin_time TIME,
    checkout_date DATE,
    people_num INTEGER,
    total_price INTEGER,
    FOREIGN KEY(hotel_id) REFERENCES work.hotel(hotel_id),
    FOREIGN KEY(customer_id) REFERENCES work.customer(customer_id)
);
COPY work.reserve FROM 'data/reserve.csv' (
    HEADER
);

DROP TABLE IF EXISTS work.production;
CREATE TABLE work.production (
    "type" VARCHAR,
    "length" FLOAT,
    thickness FLOAT,
    fault_flg BOOLEAN
);
COPY work.production FROM 'data/production.csv' (
    HEADER
);

DROP TABLE IF EXISTS work.production_missing;
CREATE TABLE work.production_missing (
    "type" VARCHAR,
    "length" FLOAT,
    thickness FLOAT,
    fault_flg BOOLEAN
);
COPY work.production_missing FROM 'data/production_missing_num_4_redshift.csv' (
    HEADER
);

DROP TABLE IF EXISTS work.holiday_mst;
CREATE TABLE work.holiday_mst (
    target_day DATE,
    holidayday_flg BOOLEAN,
    nextday_is_holiday_flg BOOLEAN
);
COPY work.holiday_mst FROM 'data/holiday_mst.csv' (
    HEADER
);

DROP TABLE IF EXISTS work.month_mst;
CREATE TABLE work.month_mst (
    year_num INTEGER,
    month_num INTEGER,
    month_first_day DATE,
    month_last_day DATE
);
COPY work.month_mst FROM 'data/month_mst.csv' (
    HEADER
);
