create table IF NOT EXISTS RepoFileCount (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  file_count BIGINT,
  UNIQUE (repo_id)
);
