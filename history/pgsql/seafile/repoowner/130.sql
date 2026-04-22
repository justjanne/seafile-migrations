create table IF NOT EXISTS RepoOwner (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  owner_id VARCHAR(255),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoOwner_owner_id ON RepoOwner (owner_id);
