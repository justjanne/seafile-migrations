create table IF NOT EXISTS FolderGroupPerm (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36) NOT NULL,
  path TEXT NOT NULL,
  permission CHAR(15),
  group_id INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_FolderGroupPerm_repo_id ON FolderGroupPerm (repo_id);
