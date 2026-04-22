create table IF NOT EXISTS RepoSize (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  size BIGINT,
  head_id CHAR(41),
  UNIQUE (repo_id)
);
