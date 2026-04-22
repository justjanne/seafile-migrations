CREATE TABLE `RepoTrash` (
  `repo_id` char(36),
  `repo_name` varchar(255),
  `head_id` char(40),
  `owner_id` varchar(255),
  `size` bigint,
  `org_id` int,
  PRIMARY KEY (`repo_id`),
  KEY (`owner_id`),
  KEY (`org_id`)
) ENGINE=INNODB;
