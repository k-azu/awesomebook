import duckdb
import polars as pl

conn = duckdb.connect("awesomebk.duckdb")


# ------------------------------------------------------------------
# DDL
# ------------------------------------------------------------------
# %%
SQL = """
CREATE SCHEMA work
"""
conn.execute(SQL)


# %%
SQL = """
CREATE OR REPLACE TABLE work.customer (
    customer_id VARCHAR PRIMARY KEY,
    age INTEGER,
    sex VARCHAR,
    home_latitude FLOAT,
    home_longitude FLOAT,
);
COPY work.customer FROM 'data/customer.csv' (
    HEADER
);
"""
conn.execute(SQL)

SQL = """
SELECT *
FROM work.customer
"""
conn.execute(SQL).fetchdf()

SQL = """
DESCRIBE work.customer
"""
conn.execute(SQL).fetchdf()


# %%
SQL = """
CREATE OR REPLACE TABLE work.hotel (
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
"""
conn.execute(SQL)

SQL = """
SELECT *
FROM work.hotel
"""
conn.execute(SQL).fetchdf()

SQL = """
DESCRIBE work.hotel
"""
conn.execute(SQL).fetchdf()


# %%
SQL = """
CREATE OR REPLACE TABLE work.reserve (
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
"""
conn.execute(SQL)

SQL = """
SELECT checkin_date, checkin_time
FROM work.reserve
"""
conn.execute(SQL).fetchdf()

conn.execute("""DESCRIBE work.reserve""").fetchdf()


# %%
SQL = """
CREATE OR REPLACE TABLE work.production (
    "type" VARCHAR,
    "length" FLOAT,
    thickness FLOAT,
    fault_flg BOOLEAN
);
COPY work.production FROM 'data/production.csv' (
    HEADER
);
"""
conn.execute(SQL)

SQL = """
SELECT *
FROM work.production
"""
conn.execute(SQL).fetchdf()

conn.execute("""DESCRIBE work.production""").fetchdf()


# %%
SQL = """
CREATE OR REPLACE TABLE work.production_missing (
    "type" VARCHAR,
    "length" FLOAT,
    thickness FLOAT,
    fault_flg BOOLEAN
);
COPY work.production_missing FROM 'data/production_missing_num_4_redshift.csv' (
    HEADER
);
"""
conn.execute(SQL)

SQL = """
SELECT *
FROM work.production_missing
"""
conn.execute(SQL).fetchdf()

conn.execute("""DESCRIBE work.production_missing""").fetchdf()


# %%
SQL = """
CREATE OR REPLACE TABLE work.holiday_mst (
    target_day DATE,
    holidayday_flg BOOLEAN,
    nextday_is_holiday_flg BOOLEAN
);
COPY work.holiday_mst FROM 'data/holiday_mst.csv' (
    HEADER
);
"""
conn.execute(SQL)

SQL = """
SELECT *
FROM work.holiday_mst
"""
conn.execute(SQL).fetchdf()

conn.execute("""DESCRIBE work.holiday_mst""").fetchdf()


# %%
SQL = """
CREATE OR REPLACE TABLE work.month_mst (
    year_num INTEGER,
    month_num INTEGER,
    month_first_day DATE,
    month_last_day DATE
);
COPY work.month_mst FROM 'data/month_mst.csv' (
    HEADER
);
"""
conn.execute(SQL).fetchall()


SQL = """
SELECT *
FROM work.month_mst
"""
conn.execute(SQL).fetchdf()

conn.execute("""DESCRIBE work.month_mst""").fetchdf()


# ------------------------------------------------------------------
# sandbox
# ------------------------------------------------------------------
# %%
conn.execute("""SELECT * FROM information_schema.tables""").fetchdf()
conn.execute("""SELECT * FROM information_schema.schemata""").fetchdf()
conn.execute("""SELECT current_schemas(false)""").fetchdf()

data = [
    pl.Series("col1", [1, 2], dtype=pl.Float32),
    pl.Series("col2", [3, 4], dtype=pl.Int64),
]
df2 = pl.DataFrame(data)
df2_arrow = df2.to_arrow()

duckdb.query("SELECT * FROM df2_arrow").to_arrow_table()


pl.from_arrow(duckdb.query("SELECT * FROM df2_arrow").to_arrow_table())


# %%
duckdb.query("""
SELECT * FROM df2_arrow
""")

duckdb.query("""
SELECT current_timestamp::timestamptz
""")

conn.execute("""
WITH month AS (
SELECT date_format(t2.date_column, '%Y%m') AS date_column
  FROM (
    VALUES(
      generate_series(date '2022-04-01', current_date, INTERVAL '1' month)
    )
  ) AS t1(date_array)
  CROSS JOIN unnest(date_array) AS t2(date_column)
)

SELECT * FROM month
""").df()

duckdb.query("""
SELECT unnest(date_array)::date as date_column
FROM (
    VALUES(
        generate_series(date '2022-04-01', current_date, INTERVAL '1' month)
    )
) AS t1(date_array)
""").df()

duckdb.query("""
SELECT
    *
FROM
    UNNEST(generate_series(date '2021-04-01', current_date, INTERVAL '1' month)) AS t(date_col)
""").df()


SQL = """
SELECT * FROM information_schema.schemata
"""

conn.execute(SQL).fetchdf()

conn.execute("""SHOW TABLES""").fetchdf()

conn.execute("""DESCRIBE work.customer""").fetchdf()

SQL = """
SELECT * FROM read_csv_auto('data/customer.csv', HEADER=TRUE)
"""

conn.execute(SQL).fetchdf()

