create table IF NOT EXISTS SharedRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  from_email VARCHAR(255),
  to_email VARCHAR(255),
  permission CHAR(15)
);

CREATE INDEX IF NOT EXISTS idx_SharedRepo_repo_id ON SharedRepo (repo_id);

CREATE INDEX IF NOT EXISTS idx_SharedRepo_from_email ON SharedRepo (from_email);

CREATE INDEX IF NOT EXISTS idx_SharedRepo_to_email ON SharedRepo (to_email);
