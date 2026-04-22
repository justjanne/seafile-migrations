create table IF NOT EXISTS UserShareQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  quota BIGINT,
  UNIQUE ("user")
);
