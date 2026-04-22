create table IF NOT EXISTS FolderUserPerm (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36) NOT NULL,
  path TEXT NOT NULL,
  permission CHAR(15),
  "user" VARCHAR(255) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_FolderUserPerm_repo_id ON FolderUserPerm (repo_id);
