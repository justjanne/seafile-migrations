create table IF NOT EXISTS FileLocks (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40) NOT NULL,
  path TEXT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  lock_time BIGINT,
  expire BIGINT
);

CREATE INDEX IF NOT EXISTS idx_FileLocks_repo_id ON FileLocks (repo_id);
