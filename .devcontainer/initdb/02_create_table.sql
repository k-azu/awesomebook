\c awesomebk

CREATE TABLE work.customer_tb
(
  customer_id      TEXT NOT NULL,
  age         	   INTEGER NOT NULL,
  sex      		   TEXT NOT NULL,
  home_latitude    NUMERIC NOT NULL,
  home_longitude   NUMERIC NOT NULL,
  primary key(customer_id)
);

CREATE TABLE work.holiday_mst
(
  target_day             DATE NOT NULL,
  holidayday_flg         BOOLEAN NOT NULL,
  nextday_is_holiday_flg BOOLEAN NOT NULL
);

CREATE TABLE work.hotel_tb
(
  hotel_id        TEXT NOT NULL,
  base_price      INTEGER NOT NULL,
  big_area_name   TEXT NOT NULL,
  small_area_name TEXT NOT NULL,
  hotel_latitude  NUMERIC NOT NULL,
  hotel_longitude NUMERIC NOT NULL,
  is_business     BOOLEAN NOT NULL,
  PRIMARY KEY(hotel_id)
);

CREATE TABLE work.month_mst
(
  year_num          INTEGER NOT NULL,
  month_num         INTEGER NOT NULL,
  month_first_day   DATE NOT NULL,
  month_last_day    DATE NOT NULL
);

CREATE TABLE work.production_tb
(
  type TEXT NOT NULL,
  length NUMERIC NOT NULL,
  thickness NUMERIC NOT NULL,
  fault_flg BOOLEAN NOT NULL
);

CREATE TABLE work.production_missn_tb
(
  type TEXT NOT NULL,
  length NUMERIC NOT NULL,
  thickness NUMERIC,
  fault_flg BOOLEAN NOT NULL
);

CREATE TABLE work.reserve_tb
(
  reserve_id TEXT NOT NULL,
  hotel_id TEXT NOT NULL,
  customer_id TEXT NOT NULL,
  reserve_datetime TIMESTAMP NOT NULL,
  checkin_date DATE NOT NULL,
  checkin_time TIME NOT NULL,
  checkout_date DATE NOT NULL,
  people_num INTEGER NOT NULL,
  total_price INTEGER NOT NULL,
  PRIMARY KEY(reserve_id),
  FOREIGN KEY(hotel_id) REFERENCES work.hotel_tb(hotel_id),
  FOREIGN KEY(customer_id) REFERENCES work.customer_tb(customer_id)
);
