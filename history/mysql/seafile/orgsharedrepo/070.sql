CREATE TABLE `OrgSharedRepo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
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
