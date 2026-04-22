create table IF NOT EXISTS RepoTrash (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  repo_name VARCHAR(255),
  head_id CHAR(40),
  owner_id VARCHAR(255),
  size BIGINT,
  org_id INTEGER,
  del_time BIGINT,
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoTrash_owner_id ON RepoTrash (owner_id);

CREATE INDEX IF NOT EXISTS idx_RepoTrash_org_id ON RepoTrash (org_id);
