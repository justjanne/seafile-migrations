create table IF NOT EXISTS RepoGroup (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  group_id INTEGER,
  user_name VARCHAR(255),
  permission CHAR(15),
  UNIQUE (group_id, repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoGroup_repo_id ON RepoGroup (repo_id);

CREATE INDEX IF NOT EXISTS idx_RepoGroup_user_name ON RepoGroup (user_name);
