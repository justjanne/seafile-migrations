create table IF NOT EXISTS OrgInnerPubRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  permission CHAR(15),
  UNIQUE (org_id, repo_id)
);
