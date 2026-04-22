create table IF NOT EXISTS RepoSyncError (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  token CHAR(41),
  error_time BIGINT,
  error_con VARCHAR(1024),
  UNIQUE (token)
);
