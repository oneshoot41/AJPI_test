-- +micrate Up
CREATE TABLE customer_invoices (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  amount FLOAT,
  paid BOOL,
  estimated BOOL,
  type VARCHAR(255),
  month_id BIGINT,
  customer_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE INDEX customer_id_idx ON customer_invoices (
  customer_id
);

CREATE INDEX month_id_idx ON customer_invoices (
  month_id
);


-- +micrate Down
DROP TABLE IF EXISTS customer_invoices;
