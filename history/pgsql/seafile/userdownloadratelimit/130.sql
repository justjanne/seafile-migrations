create table IF NOT EXISTS UserDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  download_limit BIGINT,
  UNIQUE ("user")
);
