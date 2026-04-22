create table IF NOT EXISTS Repo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  UNIQUE (repo_id)
);
