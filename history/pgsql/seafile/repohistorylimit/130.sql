create table IF NOT EXISTS RepoHistoryLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  days INTEGER,
  UNIQUE (repo_id)
);
