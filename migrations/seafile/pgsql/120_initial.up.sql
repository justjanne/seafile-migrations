CREATE TABLE IF NOT EXISTS OrgUserDefaultQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  quota BIGINT,
  UNIQUE (org_id)
);

CREATE TABLE IF NOT EXISTS OrgDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  download_limit BIGINT,
  UNIQUE (org_id)
);

CREATE TABLE IF NOT EXISTS OrgUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  upload_limit BIGINT,
  UNIQUE (org_id)
);

ALTER TABLE RepoInfo ADD COLUMN type VARCHAR(10);
CREATE INDEX RepoInfoTypeIndex ON RepoInfo (type);
