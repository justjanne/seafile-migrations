CREATE TABLE IF NOT EXISTS RoleUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  role VARCHAR(255),
  upload_limit BIGINT,
  UNIQUE (role)
);

CREATE TABLE IF NOT EXISTS RoleDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  role VARCHAR(255),
  download_limit BIGINT,
  UNIQUE (role)
);

CREATE TABLE IF NOT EXISTS UserUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  upload_limit BIGINT,
  UNIQUE ("user")
);

CREATE TABLE IF NOT EXISTS UserDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  download_limit BIGINT,
  UNIQUE ("user")
);

CREATE INDEX IF NOT EXISTS WebUploadTempFiles_repo_id_idx ON WebUploadTempFiles (repo_id);
ALTER TABLE RepoTokenPeerInfo ALTER COLUMN peer_ip TYPE VARCHAR(50);
