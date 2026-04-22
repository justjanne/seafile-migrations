create table IF NOT EXISTS UserUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  upload_limit BIGINT,
  UNIQUE ("user")
);
