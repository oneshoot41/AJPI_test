-- +micrate Up
CREATE TABLE months (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  customer_invoice_id BIGINT,
  provider_invoice_id BIGINT,
  year_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

CREATE INDEX customer_invoice_id_idx ON months (
  customer_invoice_id
);
CREATE INDEX provider_invoice_id_idx ON months (
  provider_invoice_id
);
CREATE INDEX year_id_idx ON months (
  year_id
);


-- +micrate Down
DROP TABLE IF EXISTS months;
