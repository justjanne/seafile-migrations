create table IF NOT EXISTS GarbageRepos (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  UNIQUE (repo_id)
);
