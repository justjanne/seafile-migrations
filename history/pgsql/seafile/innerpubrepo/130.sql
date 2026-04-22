create table IF NOT EXISTS InnerPubRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  permission CHAR(15),
  UNIQUE (repo_id)
);
