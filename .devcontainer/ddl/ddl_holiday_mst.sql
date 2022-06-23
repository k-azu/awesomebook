CREATE TABLE holiday_mst
(
  target_day             DATE NOT NULL,
  holidayday_flg         BOOLEAN NOT NULL,
  nextday_is_holiday_flg BOOLEAN NOT NULL
);

COPY holiday_mst
(
  target_day,
  holidayday_flg,
  nextday_is_holiday_flg
)
FROM '/var/lib/postgresql/csvs/holiday_mst.csv'
DELIMITER ',' CSV HEADER;
