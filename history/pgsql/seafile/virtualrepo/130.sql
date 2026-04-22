create table IF NOT EXISTS VirtualRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  origin_repo CHAR(36),
  path TEXT,
  base_commit CHAR(40),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_VirtualRepo_origin_repo ON VirtualRepo (origin_repo);
