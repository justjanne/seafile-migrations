create table IF NOT EXISTS GCID (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  gc_id CHAR(36),
  UNIQUE (repo_id)
);
