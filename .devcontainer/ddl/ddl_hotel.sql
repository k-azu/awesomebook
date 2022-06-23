CREATE TABLE hotel_tb
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

COPY hotel_tb
(
  hotel_id,
  base_price,
  big_area_name,
  small_area_name,
  hotel_latitude,
  hotel_longitude,
  is_business
)
FROM '/var/lib/postgresql/csvs/hotel.csv'
DELIMITER ',' CSV HEADER;
