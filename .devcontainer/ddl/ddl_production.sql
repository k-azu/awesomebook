CREATE TABLE production_tb
(
  type TEXT NOT NULL,
  length NUMERIC NOT NULL,
  thickness NUMERIC NOT NULL,
  fault_flg BOOLEAN NOT NULL
);

COPY production_tb
(
  type,
  length,
  thickness,
  fault_flg
)
FROM '/var/lib/postgresql/csvs/production.csv'
DELIMITER ',' CSV HEADER;
