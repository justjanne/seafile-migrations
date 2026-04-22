create table IF NOT EXISTS OrgSharedRepo (
  id SERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  from_email VARCHAR(255),
  to_email VARCHAR(255),
  permission CHAR(15)
);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_repo_id ON OrgSharedRepo (repo_id);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_org_id_repo_id ON OrgSharedRepo (org_id, repo_id);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_from_email ON OrgSharedRepo (from_email);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_to_email ON OrgSharedRepo (to_email);
