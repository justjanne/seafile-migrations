CREATE TABLE `OrgGroupRepo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`group_id`,`repo_id`),
  KEY `repo_id` (`repo_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB;
