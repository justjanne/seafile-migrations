-- Branch: table
CREATE TABLE `Branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `repo_id` char(41) DEFAULT NULL,
  `commit_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- FileLockTimestamp: table
CREATE TABLE `FileLockTimestamp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) DEFAULT NULL,
  `update_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- FileLocks: table
CREATE TABLE `FileLocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `path` text NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `lock_time` bigint(20) DEFAULT NULL,
  `expire` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- FolderGroupPerm: table
CREATE TABLE `FolderGroupPerm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) NOT NULL,
  `path` text NOT NULL,
  `permission` char(15) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- FolderPermTimestamp: table
CREATE TABLE `FolderPermTimestamp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- FolderUserPerm: table
CREATE TABLE `FolderUserPerm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) NOT NULL,
  `path` text NOT NULL,
  `permission` char(15) DEFAULT NULL,
  `user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- GCID: table
CREATE TABLE `GCID` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `gc_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- GarbageRepos: table
CREATE TABLE `GarbageRepos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- InnerPubRepo: table
CREATE TABLE `InnerPubRepo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- LastGCID: table
CREATE TABLE `LastGCID` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `client_id` varchar(128) DEFAULT NULL,
  `gc_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`client_id`)
) ENGINE=InnoDB;

-- OrgGroupRepo: table
CREATE TABLE `OrgGroupRepo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`group_id`,`repo_id`),
  KEY `repo_id` (`repo_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB;

-- OrgInnerPubRepo: table
CREATE TABLE `OrgInnerPubRepo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `repo_id` char(37) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`repo_id`)
) ENGINE=InnoDB;

-- OrgQuota: table
CREATE TABLE `OrgQuota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`)
) ENGINE=InnoDB;

-- OrgRepo: table
CREATE TABLE `OrgRepo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `repo_id` char(37) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`repo_id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `org_id_2` (`org_id`,`user`),
  KEY `user` (`user`)
) ENGINE=InnoDB;

-- OrgSharedRepo: table
CREATE TABLE `OrgSharedRepo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `repo_id` char(37) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `to_email` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`),
  KEY `org_id` (`org_id`,`repo_id`),
  KEY `from_email` (`from_email`),
  KEY `to_email` (`to_email`)
) ENGINE=InnoDB;

-- OrgUserQuota: table
CREATE TABLE `OrgUserQuota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`user`)
) ENGINE=InnoDB;

-- Repo: table
CREATE TABLE `Repo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- RepoFileCount: table
CREATE TABLE `RepoFileCount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `file_count` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- RepoGroup: table
CREATE TABLE `RepoGroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`repo_id`),
  KEY `repo_id` (`repo_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;

-- RepoHead: table
CREATE TABLE `RepoHead` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `branch_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- RepoHistoryLimit: table
CREATE TABLE `RepoHistoryLimit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- RepoInfo: table
CREATE TABLE `RepoInfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_encrypted` int(11) DEFAULT NULL,
  `last_modifier` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- RepoOwner: table
CREATE TABLE `RepoOwner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- RepoSize: table
CREATE TABLE `RepoSize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `head_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- RepoStorageId: table
CREATE TABLE `RepoStorageId` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `storage_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- RepoSyncError: table
CREATE TABLE `RepoSyncError` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` char(41) DEFAULT NULL,
  `error_time` bigint(20) unsigned DEFAULT NULL,
  `error_con` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB;

-- RepoTokenPeerInfo: table
CREATE TABLE `RepoTokenPeerInfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` char(41) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  `peer_ip` varchar(41) DEFAULT NULL,
  `peer_name` varchar(255) DEFAULT NULL,
  `sync_time` bigint(20) DEFAULT NULL,
  `client_ver` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB;

-- RepoTrash: table
CREATE TABLE `RepoTrash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `repo_name` varchar(255) DEFAULT NULL,
  `head_id` char(40) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `del_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `owner_id` (`owner_id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB;

-- RepoUserToken: table
CREATE TABLE `RepoUserToken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`token`),
  KEY `email` (`email`)
) ENGINE=InnoDB;

-- RepoValidSince: table
CREATE TABLE `RepoValidSince` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- RoleQuota: table
CREATE TABLE `RoleQuota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB;

-- SeafileConf: table
CREATE TABLE `SeafileConf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `property` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- SharedRepo: table
CREATE TABLE `SharedRepo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `to_email` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`),
  KEY `from_email` (`from_email`),
  KEY `to_email` (`to_email`)
) ENGINE=InnoDB;

-- SystemInfo: table
CREATE TABLE `SystemInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_key` varchar(256) DEFAULT NULL,
  `info_value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

-- UserQuota: table
CREATE TABLE `UserQuota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB;

-- UserShareQuota: table
CREATE TABLE `UserShareQuota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB;

-- VirtualRepo: table
CREATE TABLE `VirtualRepo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `origin_repo` char(36) DEFAULT NULL,
  `path` text,
  `base_commit` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `origin_repo` (`origin_repo`)
) ENGINE=InnoDB;

-- WebAP: table
CREATE TABLE `WebAP` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `access_property` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- WebUploadTempFiles: table
CREATE TABLE `WebUploadTempFiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `file_path` text NOT NULL,
  `tmp_file_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
