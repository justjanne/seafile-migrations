-- Branch: table
CREATE TABLE `Branch` (
  `name` varchar(10) NOT NULL,
  `repo_id` char(41) NOT NULL,
  `commit_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`repo_id`,`name`)
) ENGINE=InnoDB;

-- GarbageRepos: table
CREATE TABLE `GarbageRepos` (
  `repo_id` char(36) NOT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- InnerPubRepo: table
CREATE TABLE `InnerPubRepo` (
  `repo_id` char(37) NOT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- OrgQuota: table
CREATE TABLE `OrgQuota` (
  `org_id` int(11) NOT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB;

-- OrgUserQuota: table
CREATE TABLE `OrgUserQuota` (
  `org_id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`org_id`,`user`)
) ENGINE=InnoDB;

-- Repo: table
CREATE TABLE `Repo` (
  `repo_id` char(37) NOT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoFileCount: table
CREATE TABLE `RepoFileCount` (
  `repo_id` char(36) NOT NULL,
  `file_count` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoGroup: table
CREATE TABLE `RepoGroup` (
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  UNIQUE KEY `group_id` (`group_id`,`repo_id`),
  KEY `repo_id` (`repo_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;

-- RepoHead: table
CREATE TABLE `RepoHead` (
  `repo_id` char(37) NOT NULL,
  `branch_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoHistoryLimit: table
CREATE TABLE `RepoHistoryLimit` (
  `repo_id` char(37) NOT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoOwner: table
CREATE TABLE `RepoOwner` (
  `repo_id` char(37) NOT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`repo_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB;

-- RepoSize: table
CREATE TABLE `RepoSize` (
  `repo_id` char(37) NOT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `head_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoTokenPeerInfo: table
CREATE TABLE `RepoTokenPeerInfo` (
  `token` char(41) NOT NULL,
  `peer_id` char(41) DEFAULT NULL,
  `peer_ip` varchar(41) DEFAULT NULL,
  `peer_name` varchar(255) DEFAULT NULL,
  `sync_time` bigint(20) DEFAULT NULL,
  `client_ver` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB;

-- RepoTrash: table
CREATE TABLE `RepoTrash` (
  `repo_id` char(36) NOT NULL,
  `repo_name` varchar(255) DEFAULT NULL,
  `head_id` char(40) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `del_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`repo_id`),
  KEY `owner_id` (`owner_id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB;

-- RepoUserToken: table
CREATE TABLE `RepoUserToken` (
  `repo_id` char(37) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` char(41) DEFAULT NULL,
  UNIQUE KEY `repo_id` (`repo_id`,`token`),
  KEY `email` (`email`)
) ENGINE=InnoDB;

-- RepoValidSince: table
CREATE TABLE `RepoValidSince` (
  `repo_id` char(37) NOT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- SharedRepo: table
CREATE TABLE `SharedRepo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `info_key` varchar(256) DEFAULT NULL,
  `info_value` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB;

-- UserQuota: table
CREATE TABLE `UserQuota` (
  `user` varchar(255) NOT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB;

-- UserShareQuota: table
CREATE TABLE `UserShareQuota` (
  `user` varchar(255) NOT NULL,
  `quota` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB;

-- VirtualRepo: table
CREATE TABLE `VirtualRepo` (
  `repo_id` char(36) NOT NULL,
  `origin_repo` char(36) DEFAULT NULL,
  `path` text,
  `base_commit` char(40) DEFAULT NULL,
  PRIMARY KEY (`repo_id`),
  KEY `origin_repo` (`origin_repo`)
) ENGINE=InnoDB;

-- WebAP: table
CREATE TABLE `WebAP` (
  `repo_id` char(37) NOT NULL,
  `access_property` char(10) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
