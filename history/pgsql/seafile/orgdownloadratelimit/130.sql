create table IF NOT EXISTS OrgDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  download_limit BIGINT,
  UNIQUE (org_id)
);
