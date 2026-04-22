create table IF NOT EXISTS FileLockTimestamp (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40),
  update_time BIGINT NOT NULL,
  UNIQUE (repo_id)
);
