create table IF NOT EXISTS Branch (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(10),
  repo_id CHAR(41),
  commit_id CHAR(41),
  UNIQUE (repo_id, name)
);
