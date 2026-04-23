CREATE TABLE IF NOT EXISTS Branch (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(10),
  repo_id CHAR(41),
  commit_id CHAR(41),
  UNIQUE (repo_id, name)
);

CREATE TABLE IF NOT EXISTS FileLockTimestamp (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40),
  update_time BIGINT NOT NULL,
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS FileLocks (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40) NOT NULL,
  path TEXT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  lock_time BIGINT,
  expire BIGINT
);

CREATE INDEX IF NOT EXISTS idx_FileLocks_repo_id ON FileLocks (repo_id);

CREATE TABLE IF NOT EXISTS FolderGroupPerm (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36) NOT NULL,
  path TEXT NOT NULL,
  permission CHAR(15),
  group_id INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_FolderGroupPerm_repo_id ON FolderGroupPerm (repo_id);

CREATE TABLE IF NOT EXISTS FolderPermTimestamp (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  timestamp BIGINT,
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS FolderUserPerm (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36) NOT NULL,
  path TEXT NOT NULL,
  permission CHAR(15),
  "user" VARCHAR(255) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_FolderUserPerm_repo_id ON FolderUserPerm (repo_id);

CREATE TABLE IF NOT EXISTS GCID (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  gc_id CHAR(36),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS GarbageRepos (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS InnerPubRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  permission CHAR(15),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS LastGCID (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  client_id VARCHAR(128),
  gc_id CHAR(36),
  UNIQUE (repo_id, client_id)
);

CREATE TABLE IF NOT EXISTS OrgGroupRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  group_id INTEGER,
  owner VARCHAR(255),
  permission CHAR(15),
  UNIQUE (org_id, group_id, repo_id)
);

CREATE INDEX IF NOT EXISTS idx_OrgGroupRepo_repo_id ON OrgGroupRepo (repo_id);

CREATE INDEX IF NOT EXISTS idx_OrgGroupRepo_owner ON OrgGroupRepo (owner);

CREATE TABLE IF NOT EXISTS OrgInnerPubRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  permission CHAR(15),
  UNIQUE (org_id, repo_id)
);

CREATE TABLE IF NOT EXISTS OrgQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  quota BIGINT,
  UNIQUE (org_id)
);

CREATE TABLE IF NOT EXISTS OrgRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  "user" VARCHAR(255),
  UNIQUE (org_id, repo_id),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_OrgRepo_org_id_user ON OrgRepo (org_id, "user");

CREATE INDEX IF NOT EXISTS idx_OrgRepo_user ON OrgRepo ("user");

CREATE TABLE IF NOT EXISTS OrgSharedRepo (
  id SERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  repo_id CHAR(37),
  from_email VARCHAR(255),
  to_email VARCHAR(255),
  permission CHAR(15)
);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_repo_id ON OrgSharedRepo (repo_id);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_org_id_repo_id ON OrgSharedRepo (org_id, repo_id);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_from_email ON OrgSharedRepo (from_email);

CREATE INDEX IF NOT EXISTS idx_OrgSharedRepo_to_email ON OrgSharedRepo (to_email);

CREATE TABLE IF NOT EXISTS OrgUserQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  "user" VARCHAR(255),
  quota BIGINT,
  UNIQUE (org_id, "user")
);

CREATE TABLE IF NOT EXISTS Repo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RepoFileCount (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  file_count BIGINT,
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RepoGroup (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  group_id INTEGER,
  user_name VARCHAR(255),
  permission CHAR(15),
  UNIQUE (group_id, repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoGroup_repo_id ON RepoGroup (repo_id);

CREATE INDEX IF NOT EXISTS idx_RepoGroup_user_name ON RepoGroup (user_name);

CREATE TABLE IF NOT EXISTS RepoHead (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  branch_name VARCHAR(10),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RepoHistoryLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  days INTEGER,
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RepoInfo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  name VARCHAR(255) NOT NULL,
  update_time BIGINT,
  version INTEGER,
  is_encrypted INTEGER,
  last_modifier VARCHAR(255),
  status INTEGER DEFAULT 0,
  type VARCHAR(10),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoInfo_type ON RepoInfo (type);

CREATE TABLE IF NOT EXISTS RepoOwner (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  owner_id VARCHAR(255),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoOwner_owner_id ON RepoOwner (owner_id);

CREATE TABLE IF NOT EXISTS RepoSize (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  size BIGINT,
  head_id CHAR(41),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RepoStorageId (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40) NOT NULL,
  storage_id VARCHAR(255) NOT NULL,
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RepoSyncError (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  token CHAR(41),
  error_time BIGINT,
  error_con VARCHAR(1024),
  UNIQUE (token)
);

CREATE TABLE IF NOT EXISTS RepoTokenPeerInfo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  token CHAR(41),
  peer_id CHAR(41),
  peer_ip VARCHAR(50),
  peer_name VARCHAR(255),
  sync_time BIGINT,
  client_ver VARCHAR(20),
  UNIQUE (token)
);

CREATE INDEX IF NOT EXISTS idx_RepoTokenPeerInfo_peer_id ON RepoTokenPeerInfo (peer_id);

CREATE TABLE IF NOT EXISTS RepoTrash (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  repo_name VARCHAR(255),
  head_id CHAR(40),
  owner_id VARCHAR(255),
  size BIGINT,
  org_id INTEGER,
  del_time BIGINT,
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_RepoTrash_owner_id ON RepoTrash (owner_id);

CREATE INDEX IF NOT EXISTS idx_RepoTrash_org_id ON RepoTrash (org_id);

CREATE TABLE IF NOT EXISTS RepoUserToken (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  email VARCHAR(255),
  token CHAR(41),
  UNIQUE (repo_id, token)
);

CREATE INDEX IF NOT EXISTS idx_RepoUserToken_token ON RepoUserToken (token);

CREATE INDEX IF NOT EXISTS idx_RepoUserToken_email ON RepoUserToken (email);

CREATE TABLE IF NOT EXISTS RepoValidSince (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  timestamp BIGINT,
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS RoleQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  role VARCHAR(255),
  quota BIGINT,
  UNIQUE (role)
);

CREATE TABLE IF NOT EXISTS SeafileConf (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  cfg_group VARCHAR(255) NOT NULL,
  cfg_key VARCHAR(255) NOT NULL,
  value VARCHAR(255),
  property INTEGER
);

CREATE TABLE IF NOT EXISTS SharedRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  from_email VARCHAR(255),
  to_email VARCHAR(255),
  permission CHAR(15)
);

CREATE INDEX IF NOT EXISTS idx_SharedRepo_repo_id ON SharedRepo (repo_id);

CREATE INDEX IF NOT EXISTS idx_SharedRepo_from_email ON SharedRepo (from_email);

CREATE INDEX IF NOT EXISTS idx_SharedRepo_to_email ON SharedRepo (to_email);

CREATE TABLE IF NOT EXISTS SystemInfo (
  id SERIAL NOT NULL PRIMARY KEY,
  info_key VARCHAR(256),
  info_value VARCHAR(1024)
);

CREATE TABLE IF NOT EXISTS UserQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  quota BIGINT,
  UNIQUE ("user")
);

CREATE TABLE IF NOT EXISTS UserShareQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  "user" VARCHAR(255),
  quota BIGINT,
  UNIQUE ("user")
);

CREATE TABLE IF NOT EXISTS VirtualRepo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(36),
  origin_repo CHAR(36),
  path TEXT,
  base_commit CHAR(40),
  UNIQUE (repo_id)
);

CREATE INDEX IF NOT EXISTS idx_VirtualRepo_origin_repo ON VirtualRepo (origin_repo);

CREATE TABLE IF NOT EXISTS WebAP (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  access_property CHAR(10),
  UNIQUE (repo_id)
);

CREATE TABLE IF NOT EXISTS WebUploadTempFiles (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(40) NOT NULL,
  file_path TEXT NOT NULL,
  tmp_file_path TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_WebUploadTempFiles_repo_id ON WebUploadTempFiles (repo_id);

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

CREATE TABLE IF NOT EXISTS OrgUserDefaultQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  quota BIGINT,
  UNIQUE (org_id)
);

CREATE TABLE IF NOT EXISTS OrgDownloadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  download_limit BIGINT,
  UNIQUE (org_id)
);

CREATE TABLE IF NOT EXISTS OrgUploadRateLimit (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  org_id INTEGER,
  upload_limit BIGINT,
  UNIQUE (org_id)
);
