create table IF NOT EXISTS RepoHead (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  branch_name VARCHAR(10),
  UNIQUE (repo_id)
);
