-- +micrate Up
CREATE TABLE years (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);



-- +micrate Down
DROP TABLE IF EXISTS years;
