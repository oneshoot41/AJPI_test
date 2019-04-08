-- +micrate Up
CREATE TABLE customer_invoices (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  customer_id BIGINT,
  amount FLOAT,
  paid BOOL,
  estimated BOOL,
  type VARCHAR(255),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE INDEX customer_id_idx ON customer_invoices (
  customer_id
);


-- +micrate Down
DROP TABLE IF EXISTS customer_invoices;
