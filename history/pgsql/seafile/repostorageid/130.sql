create table IF NOT EXISTS RepoStorageId (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40) NOT NULL,
  storage_id VARCHAR(255) NOT NULL,
  UNIQUE (repo_id)
);
