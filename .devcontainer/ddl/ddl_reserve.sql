-- 作成するテーブルの名前をwork.reserve_tbとして指定
CREATE TABLE reserve_tb
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

COPY reserve_tb
(
  reserve_id,
  hotel_id,
  customer_id,
  reserve_datetime,
  checkin_date,
  checkin_time,
  checkout_date,
  people_num,
  total_price,
);
FROM '/var/lib/postgresql/csvs/reserve.csv'
DELIMITER ',' CSV HEADER;
