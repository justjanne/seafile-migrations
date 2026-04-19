ALTER TABLE RepoInfo
    ADD COLUMN status INTEGER DEFAULT 0;

CREATE TABLE IF NOT EXISTS RepoSyncError
(
    id         BIGSERIAL NOT NULL PRIMARY KEY,
    token      CHAR(41),
    error_time BIGINT,
    error_con  VARCHAR(1024),
    UNIQUE (token)
);
ALTER TABLE RepoSyncError
    MODIFY COLUMN error_con VARCHAR (1024);

CREATE TABLE IF NOT EXISTS WebUploadTempFiles
(
    id            BIGSERIAL NOT NULL PRIMARY KEY,
    repo_id       CHAR(40)  NOT NULL,
    file_path     TEXT      NOT NULL,
    tmp_file_path TEXT      NOT NULL
);
