create table IF NOT EXISTS WebUploadTempFiles (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40) NOT NULL,
  file_path TEXT NOT NULL,
  tmp_file_path TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_WebUploadTempFiles_repo_id ON WebUploadTempFiles (repo_id);
