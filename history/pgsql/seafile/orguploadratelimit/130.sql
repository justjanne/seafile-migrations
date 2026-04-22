create table IF NOT EXISTS OrgUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  upload_limit BIGINT,
  UNIQUE (org_id)
);
