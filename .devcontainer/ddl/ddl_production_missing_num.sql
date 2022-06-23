CREATE TABLE production_missn_tb
(
  type TEXT NOT NULL,
  length NUMERIC NOT NULL,
  thickness NUMERIC,
  fault_flg BOOLEAN NOT NULL
);

COPY production_missn_tb
(
  type,
  length,
  thickness,
  fault_flg
)
FROM '/var/lib/postgresql/csvs/production_missing_num_4_redshift.csv'
DELIMITER ',' CSV HEADER;
