create table IF NOT EXISTS RoleUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  role VARCHAR(255),
  upload_limit BIGINT,
  UNIQUE (role)
);
