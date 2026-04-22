create table IF NOT EXISTS RepoValidSince (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  timestamp BIGINT,
  UNIQUE (repo_id)
);
