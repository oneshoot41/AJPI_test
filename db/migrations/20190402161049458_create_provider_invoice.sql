-- +micrate Up
CREATE TABLE provider_invoices (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  amount FLOAT,
  paid BOOL,
  estimated BOOL,
  type VARCHAR(255),
  month_id BIGINT,
  provider_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE INDEX provider_id_idx ON provider_invoices (
  provider_id
);
CREATE INDEX month_id_idx ON provider_invoices (
  month_id
);


-- +micrate Down
DROP TABLE IF EXISTS provider_invoices;
