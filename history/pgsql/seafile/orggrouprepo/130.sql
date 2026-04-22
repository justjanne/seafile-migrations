create table IF NOT EXISTS OrgGroupRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  group_id INTEGER,
  owner VARCHAR(255),
  permission CHAR(15),
  UNIQUE (org_id, group_id, repo_id)
);

CREATE INDEX IF NOT EXISTS idx_OrgGroupRepo_repo_id ON OrgGroupRepo (repo_id);

CREATE INDEX IF NOT EXISTS idx_OrgGroupRepo_owner ON OrgGroupRepo (owner);
