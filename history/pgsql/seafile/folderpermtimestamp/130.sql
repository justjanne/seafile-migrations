create table IF NOT EXISTS FolderPermTimestamp (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  timestamp BIGINT,
  UNIQUE (repo_id)
);
