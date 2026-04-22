create table IF NOT EXISTS OrgUserDefaultQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  quota BIGINT,
  UNIQUE (org_id)
);
