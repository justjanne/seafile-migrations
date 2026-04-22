create table IF NOT EXISTS RepoUserToken (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  email VARCHAR(255),
  token CHAR(41),
  UNIQUE (repo_id, token)
);

CREATE INDEX IF NOT EXISTS idx_RepoUserToken_token ON RepoUserToken (token);

CREATE INDEX IF NOT EXISTS idx_RepoUserToken_email ON RepoUserToken (email);
