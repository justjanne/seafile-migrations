-- Branch: table
CREATE TABLE `Branch` (
  `name` varchar(10) NOT NULL,
  `repo_id` char(41) NOT NULL,
  `commit_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`repo_id`,`name`)
) ENGINE=InnoDB;

-- InnerPubRepo: table
CREATE TABLE `InnerPubRepo` (
  `repo_id` char(37) NOT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- OrgQuota: table
CREATE TABLE `OrgQuota` (
  `org_id` int NOT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB;

-- OrgUserQuota: table
CREATE TABLE `OrgUserQuota` (
  `org_id` int NOT NULL,
  `user` varchar(255) NOT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`,`user`)
) ENGINE=InnoDB;

-- Repo: table
CREATE TABLE `Repo` (
  `repo_id` char(37) NOT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoGroup: table
CREATE TABLE `RepoGroup` (
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
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
  `days` int DEFAULT NULL,
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
  `size` bigint unsigned DEFAULT NULL,
  `head_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- RepoUserToken: table
CREATE TABLE `RepoUserToken` (
  `repo_id` char(37) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` char(41) DEFAULT NULL,
  UNIQUE KEY `repo_id` (`repo_id`,`token`)
) ENGINE=InnoDB;

-- RepoValidSince: table
CREATE TABLE `RepoValidSince` (
  `repo_id` char(37) NOT NULL,
  `timestamp` bigint DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;

-- SharedRepo: table
CREATE TABLE `SharedRepo` (
  `repo_id` char(37) DEFAULT NULL,
  `from_email` varchar(512) DEFAULT NULL,
  `to_email` varchar(512) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;

-- UserQuota: table
CREATE TABLE `UserQuota` (
  `user` varchar(255) NOT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB;

-- WebAP: table
CREATE TABLE `WebAP` (
  `repo_id` char(37) NOT NULL,
  `access_property` char(10) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
