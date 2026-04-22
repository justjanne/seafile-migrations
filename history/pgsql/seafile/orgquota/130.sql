create table IF NOT EXISTS OrgQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  quota BIGINT,
  UNIQUE (org_id)
);
