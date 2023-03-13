
CREATE TABLE IF NOT EXISTS star_schema.branch_dim
(
    branch_id bigint NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    address varchar(30)  NOT NULL,
    country varchar(30)  NOT NULL,
)

CREATE TABLE IF NOT EXISTS star_schema.date_dim
(
    date_id bigint NOT NULL PRIMARY KEY,
    "Year" smallint NOT NULL CHECK("Year" > 0),
    "Month" smallint NOT NULL CHECK("Year" > 0 and "Year" <=12),
    "Quarter" smallint NOT NULL CHECK("Year" > 0 and "Year" <=4),
    "Date" smallint NOT NULL CHECK("Year" > 0 and "Year" <=31),
)

CREATE TABLE IF NOT EXISTS star_schema.dealer
(
    dealer_id bigint NOT NULL,
    location_id bigint NOT NULL ,
    country_id bigint NOT NULL ,
    dealer_nm character varying(50),
    dealer_contact character varying(30),
    CONSTRAINT dealer_pkey PRIMARY KEY (dealer_id)
)

CREATE TABLE IF NOT EXISTS star_schema.product
(
    product_id bigint NOT NULL ,
    model_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    product_nm character varying(50) NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (product_id),
    CONSTRAINT prod_model_unique UNIQUE (model_id)
)

CREATE TABLE IF NOT EXISTS star_schema.revenue
(
    dealer_id bigint NOT NULL REFERENCES star_schema.revenue (dealer_id),
    model_id bigint NOT NULL REFERENCES star_schema.revenue (model_id),
    branch_id bigint NOT NULL REFERENCES star_schema.revenue (branch_id),
    date_id bigint NOT NULL REFERENCES star_schema.revenue (date_id),
    units_sold integer NOT NULL,
    revenue double precision NOT NULL
);
