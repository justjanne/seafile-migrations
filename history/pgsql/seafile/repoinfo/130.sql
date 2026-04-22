create table IF NOT EXISTS RepoInfo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  name VARCHAR(255) NOT NULL,
  update_time BIGINT,
  version INTEGER,
  is_encrypted INTEGER,
  last_modifier VARCHAR(255),
  status INTEGER DEFAULT 0,
  type VARCHAR(10),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoInfo_type ON RepoInfo (type);
