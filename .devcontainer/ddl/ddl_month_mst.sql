CREATE TABLE month_mst
(
  year_num          INTEGER NOT NULL,
  month_num         INTEGER NOT NULL,
  month_first_day   DATE NOT NULL,
  month_last_day    DATE NOT NULL
);

COPY month_mst 
(
  year_num,
  month_num,
  month_first_day,
  month_last_day
)
FROM '/var/lib/postgresql/csvs/month_mst.csv'
DELIMITER ',' CSV HEADER;
