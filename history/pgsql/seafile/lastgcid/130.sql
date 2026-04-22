create table IF NOT EXISTS LastGCID (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  client_id VARCHAR(128),
  gc_id CHAR(36),
  UNIQUE (repo_id, client_id)
);
