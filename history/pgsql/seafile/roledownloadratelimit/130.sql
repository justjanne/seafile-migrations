create table IF NOT EXISTS RoleDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  role VARCHAR(255),
  download_limit BIGINT,
  UNIQUE (role)
);
