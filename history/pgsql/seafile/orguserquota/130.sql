create table IF NOT EXISTS OrgUserQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  "user" VARCHAR(255),
  quota BIGINT,
  UNIQUE (org_id, "user")
);
