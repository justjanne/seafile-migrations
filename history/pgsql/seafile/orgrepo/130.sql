create table IF NOT EXISTS OrgRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  "user" VARCHAR(255),
  UNIQUE (org_id, repo_id),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_OrgRepo_org_id_user ON OrgRepo (org_id, "user");

CREATE INDEX IF NOT EXISTS idx_OrgRepo_user ON OrgRepo ("user");
